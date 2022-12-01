<?php

namespace App\Services;

use App\Helper\MessageHelper;
use App\Models\Article;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class ArticleService
{
    private MessageHelper $messageHelper;

    public function __construct(MessageHelper $messageHelper)
    {
        $this->messageHelper = $messageHelper;
    }

    public function createArticle($request): object
    {
        try {
            $imagePath = $this->uploadImage($request->image);
            if ($imagePath) {
                Article::create([
                    'name' => $request->name,
                    'category_id' => $request->category_id,
                    'description' => $request->description,
                    'picture' => $imagePath,
                    'quantity' => $request->quantity,
                    'price' => $request->price,
                    'discount' => $request->discount
                ]);
                return response()->json(array('status' => true, 'message' => 'Item has been successfully saved!'));
            } else {
                return response()->json(array('status' => false, 'message' => 'Something went wrong with a picture! Please try again!'), '500');
            }
        } catch (\Exception $exception) {
            Log::info($exception);
            return $this->messageHelper->serverErrorResponse();
        }

    }

    public function updateArticle($request, $id, $role): object
    {
        try {
            $article = array();
            if ($role == 'admin') {
                is_file($request->image) ? $imagePath = $this->uploadImage($request->image) : $imagePath = $request->image;
                $article['name'] = $request->name;
                $article['category_id'] = $request->category_id;
                $article['description'] = $request->description;
                $article['picture'] = $imagePath;
                $article['quantity'] = $request->quantity;
                $article['price'] = $request->price;
            } else {
                $article['quantity'] = $request->quantity;
            }
            $article['discount'] = $request->discount;
            Article::where('id', $id)->update($article);

            return response()->json(array('status' => true, 'message' => 'Item has been updated successfully!'));
        } catch (\Exception $exception) {
            Log::info($exception);
            return $this->messageHelper->serverErrorResponse();
        }

    }

    public function getArticle($request, $id): object
    {
        try {
            isset($request->uloga) && ($request->uloga == 'admin' || $request->uloga == 'prodavac') ? $article = Article::where('id', $id)->first() : $article = Article::where('id', $id)->where('quantity', '>', 0)->first();

            $article ? $response = response()->json(array('status' => true, 'article' => $article, 'message' => 'Article are successfully returned!')) : $response = $this->messageHelper->itemNotFound();
            return $response;
        } catch (\Exception $exception) {
            Log::info($exception);
            return $this->messageHelper->serverErrorResponse();
        }

    }

    public function getArticles($request): object
    {
        try {
            isset($request->uloga) && ($request->uloga == 'admin' || $request->uloga == 'prodavac') ? $query = Article::query() : $query = Article::where('quantity', '>', 0);
            //↑
            //Ukoliko se uloga ne posalje smatrace se da je neophodan prikaz za pocetnu stranu ili na mestu sajta gde svi mogu videti proizvode. U slucaju slanja uloge proverava se da li je admin ili prodavac jer u slucaju kada su te dve uloge u pitanju smatra se da je neophodan prikaz artikla u nekakvom admin panelu i editovanje istih. (promena stanja, promena popusta itd...).

            if (isset($request->sortByName)) {
                $query->where('name', 'like',  '%' . $request->sortByName . '%');
            }
            if (isset($request->filterByCategory)) {
                $query->where('category_id', $request->filterByCategory);
            }
            if (isset($request->sortByPrice)) {
                if ($request->sortByPrice == 'up') {
                    $query->orderBy('price');
                } elseif($request->sortByPrice == 'down') {
                    $query->orderBy('price', 'desc');
                }
            } elseif (isset($request->sortByDiscountPercentage)) {
                if ($request->sortByDiscountPercentage == 'up') {
                    $query->orderBy('discount');
                } elseif($request->sortByDiscountPercentage == 'down') {
                    $query->orderBy('discount', 'desc');
                }
            }
            $articles = $query->get();

            $articles->isEmpty() ? $response = response()->json(array('status' => true, 'article' => $articles, 'message' => 'There are no items with this data to filter and sort!')) : $response = response()->json(array('status' => true, 'article' => $articles, 'message' => 'Successfully sorted and filtered articles!'));
            return $response;
        } catch (\Exception $exception) {
            Log::info($exception);
            return $this->messageHelper->serverErrorResponse();
        }

    }

    public function deleteArticle($id): object
    {
        try {
            $deletedArticle = Article::where('id', $id)->delete();
            $deletedArticle ? $response = response()->json(array('status' => true, 'message' => 'Item was successfully deleted!')) : $response = $this->messageHelper->itemNotFound();
            return $response;
        } catch (\Exception $exception) {
            Log::info($exception);
            return $this->messageHelper->serverErrorResponse();
        }

    }

    public function purchaseArticle($request):object
    {
        try {
            if (isset($request->articles)) {
                $successArticleArray = array();
                foreach ($request->articles as $oneArticle) {
                    $article = Article::where('id', $oneArticle['articleId'])->where('quantity', '>', 0)->first();
                    if ($article) {
                        if ($article->quantity - $oneArticle['quantity'] >= 0) {
                            $article->quantity = $article->quantity - $oneArticle['quantity'];
                            $successArticleArray[] = $article;
                        } else {
                            return response()->json(array('status' => false, 'message' => 'There are not enough quantity for the item: '.$article->name),404);
                        }
                    } else {
                        return $this->messageHelper->itemNotFound();
                    }
                }
                foreach ($successArticleArray as $purchaseArticle) {
                    $purchaseArticle->save();
                }
                return response()->json(array('status' => true, 'message' => 'Successful purchase!'));
            } else {
                return response()->json(array('status' => false, 'message' => 'Articles was not sent!'));
            }
        } catch (\Exception $exception) {
            Log::info($exception);
            return $this->messageHelper->serverErrorResponse();
        }
    }

    private function uploadImage($image): string
    {
        try {
            $imageName = time(). '.' .$image->extension();
            return Storage::disk('public')->putFileAs('images', $image, $imageName);
        } catch (\Exception $exception) {
            Log::info($exception);
            return false;
        }

    }

}
