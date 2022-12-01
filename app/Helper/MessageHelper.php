<?php

namespace App\Helper;

class MessageHelper
{
    public function permissionDeniedResponse(): object
    {
        return response()->json(array('status' => false, 'message' => "You don't have permission for this action!"), '403');
    }

    public function serverErrorResponse(): object
    {
        return response()->json(array('status' => false, 'message' => "Something went wrong. Please try again!"), '500');
    }

    public function itemNotFound(): object
    {
        return response()->json(array('status' => false, 'message' => 'Item does not exist in database!'),404);
    }
}
