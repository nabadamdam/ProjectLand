<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Article extends Model
{
    use SoftDeletes;

    protected $fillable =
    [
        'name',
        'category_id',
        'description',
        'picture',
        'quantity',
        'price',
        'discount',
    ];
}
