<?php

namespace App\Controller;

use App\Entity\Etablissement;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HotelController extends AbstractController
{
    private $entityManager;

    /**
     * @param $entityManager
     */
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    /**
     * @Route("/hotel", name="app_hotels")
     */
    public function index(Request $request, EntityManagerInterface $em): Response
    {
        $hotels = $this->entityManager->getRepository(Etablissement::class)->findAll();

        return $this->render('hotel/index.html.twig', [
            'hotels' => $hotels
        ]);
    }

    /**
     * @Route("/hotel/{slug}", name="hotel")
     */
    public function show($slug): Response
    {
        $hotel = $this->entityManager->getRepository(Etablissement::class)->findOneBy(['slug' => $slug]);

        if(!$hotel){
            return $this->redirectToRoute('hotels');
        }
        return $this->render('hotel/show.html.twig', [
            'hotel' => $hotel,
        ]);
    }
}
