<?php

namespace App\Classe;

use App\Entity\Ville;

class Search
{
    /**
     * @var string
     */
     public $string='';

    /**
     * @var Ville[]
     */
     public $categories = [];

    public function __toString()
    {
        return '';
    }
}