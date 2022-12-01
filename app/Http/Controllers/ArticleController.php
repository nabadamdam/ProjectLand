<?php

namespace App\Http\Controllers;

use App\Helper\MessageHelper;
use App\Http\Requests\ArticleRequest;
use App\Services\ArticleService;
use Illuminate\Http\Request;
use app\Models\Article;
use app\Models\Category;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Storage;

class ArticleController extends Controller
{
    private ArticleService $articleService;
    private MessageHelper $messageHelper;

    public function __construct(ArticleService $articleService, MessageHelper $messageHelper)
    {
        $this->articleService = $articleService;
        $this->messageHelper = $messageHelper;
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index(Request $request): object
    {
        return $this->articleService->getArticles($request);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param ArticleRequest $request
     * @return Response
     */
    public function store(ArticleRequest $request): object
    {
        isset($request->uloga) && $request->uloga == 'admin' ? $response = $this->articleService->createArticle($request) : $response = $this->messageHelper->permissionDeniedResponse();
        return $response;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show(Request $request, int $id): object
    {
        return $this->articleService->getArticle($request, $id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param ArticleRequest $request
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, int $id): object
    {
        isset($request->uloga) && ($request->uloga == 'admin' || $request->uloga == 'prodavac') ? $response = $this->articleService->updateArticle($request, $id, $request->uloga) : $response = $this->messageHelper->permissionDeniedResponse();
        return $response;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy(Request $request, int $id): object
    {
        isset($request->uloga) && $request->uloga == 'admin' ? $response = $this->articleService->deleteArticle($id) : $response = $this->messageHelper->permissionDeniedResponse();
        return $response;
    }

}
