<?php

namespace App\Controller\Admin;

use App\Entity\Etablissement;
use App\Entity\Gerant;
use App\Entity\Reservation;
use App\Entity\Suite;
use App\Entity\User;
use App\Entity\Ville;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {
        return parent::index();
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Hypnos');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToDashboard('Dashboard', 'fa fa-home');
        yield MenuItem::linkToCrud('Client', 'fas fa-user', User::class);
        yield MenuItem::linkToCrud('Etablissement', ' fa fa-solid fa-hotel', Etablissement::class);
        yield MenuItem::linkToCrud('Gérant', 'fa fas fa-user', Gerant::class);
        yield MenuItem::linkToCrud('Réservation', 'fa fa-solid fa-calendar', Reservation::class);
        yield MenuItem::linkToCrud('Suite', 'fas fa-solid fa-bed-front', Suite::class);
        yield MenuItem::linkToCrud('Ville', 'fa fa-solid fa-city', Ville::class);
    }
}
