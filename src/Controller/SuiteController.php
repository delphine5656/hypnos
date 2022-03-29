<?php

namespace App\Controller;

use App\Classe\Search;
use App\Entity\Suite;
use App\Entity\Ville;
use App\Form\SearchType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
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
    public function index(Request $request): Response
    {
        $suites = $this->entityManager->getRepository(Suite::class)->findAll();
        $search = new Search();
        $form = $this->createForm(SearchType::class, $search);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $search = $form->getData();
            $suites = $this->entityManager->getRepository(Suite::class)->findWithSearch($search);


        }




        return $this->render('suite/index.html.twig', [
            'suites' => $suites,
            'form' => $form->createView()

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
