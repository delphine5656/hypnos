<?php

namespace App\Controller;

use App\Entity\Suite;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class SuiteController extends AbstractController
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
     * @Route("/suite", name="suites")
     */
    public function index(): Response
    {
        $suites = $this->entityManager->getRepository(Suite::class)->findAll();
        return $this->render('suite/index.html.twig', [
            'suites' => $suites
        ]);
    }

    /**
     * @Route("/suite/{slug}", name="suite")
     */
    public function show($slug): Response
    {
        $suite = $this->entityManager->getRepository(Suite::class)->findOneBy(['slug' => $slug]);

        if(!$suite){
            return $this->redirectToRoute('suites');
        }
        return $this->render('suite/show.html.twig', [
            'suite' => $suite,
        ]);
    }
}
