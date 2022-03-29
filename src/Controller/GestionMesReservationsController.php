<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GestionMesReservationsController extends AbstractController
{
    /**
     * @Route("/gestion/mes/reservations", name="app_gestion_mes_reservations")
     */
    public function index(): Response
    {
        return $this->render('gestion_mes_reservations/index.html.twig');
    }
}
