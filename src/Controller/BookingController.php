<?php

namespace App\Controller;

use App\Entity\Reservation;
use App\Form\Reservation1Type;
use App\Repository\ReservationRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;




/**
 * @Route("/booking")
 */
class BookingController extends AbstractController
{
    /**
     * @Route("/new", name="app_booking_new", methods={"GET"})
     */
    public function calendar(): Response
    {
        return $this->render('booking/calendar.html.twig');
    }


    /**
     * @Route("/", name="app_booking_index", methods={"GET"})
     */
    public function index(ReservationRepository $reservationRepository): Response
    {
        return $this->render('booking/index.html.twig', [
            'reservations' => $reservationRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="app_booking_new", methods={"GET", "POST"})
     */
    public function new(Request $request, ReservationRepository $reservationRepository): Response
    {
        $reservation = new Reservation();
        $form = $this->createForm(Reservation1Type::class, $reservation);
        $form->handleRequest($request);







        if ($form->isSubmitted() && $form->isValid()) {
            $user = $this->getUser();
            $reservation->setUser($user);

            $reservationRepository->add($reservation);

            return $this->redirectToRoute('account', [], Response::HTTP_SEE_OTHER);
        }


        return $this->renderForm('booking/new.html.twig', [
            'reservation' => $reservation,
            'form' => $form,
        ]);


    }

    /**
     * @Route("/{id}", name="app_booking_show", methods={"GET"})
     */
    public function show(Reservation $reservation): Response
    {
        return $this->render('booking/show.html.twig', [
            'reservation' => $reservation,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="app_booking_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Reservation $reservation, ReservationRepository $reservationRepository): Response
    {
        $form = $this->createForm(Reservation1Type::class, $reservation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $reservationRepository->add($reservation);
            return $this->redirectToRoute('account', [], Response::HTTP_SEE_OTHER);
        }


        return $this->renderForm('booking/edit.html.twig', [
            'reservation' => $reservation,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="app_booking_delete", methods={"POST"})
     */
    public function delete(Request $request, Reservation $reservation, ReservationRepository $reservationRepository): Response
    {

           if ($this->isCsrfTokenValid('delete'.$reservation->getId(), $request->request->get('_token'))) {
               $reservationRepository->remove($reservation);
               $this->addFlash(
                   'success',
                   "La réservation a bien été supprimée"
               );
           }


        return $this->redirectToRoute('account', [], Response::HTTP_SEE_OTHER);
    }



}