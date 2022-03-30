<?php

namespace App\EventListener;

use App\Repository\ReservationRepository;
use CalendarBundle\Event\Event;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

class FullCalendarListener
{
    private $reservationRepository;
    private $router;

    public function __construct(ReservationRepository $reservationRepository, UrlGeneratorInterface $router)
    {
        $this->reservationRepository = $reservationRepository;
        $this->router = $router;
    }

    public function loadEvents(Event $calendar): void
    {
        $start = $calendar->getStart();
        $end = $calendar->getEnd();
        $filters = $calendar->getFilters();

        // Modify the query to fit to your entity and needs
        // Change b.beginAt by your start date in your custom entity
        $reservationRepository = $this->reservationRepository
            ->createQueryBuilder('booking')
            ->where('reservation.dateDebut BETWEEN :dateDebut and :dateFin')
            ->setParameter('dateDebut', $start->format('Y-m-d H:i:s'))
            ->setParameter('dateFin',$end->format('Y-m-d H:i:s'))
            ->getQuery()
            ->getResult()
        ;

        foreach ($reservationRepository as $reservation) {

            $bookingEvent = new Event(
                $reservation->getTitre(),
                $reservation->getDateDebut(),
                $reservation->getDateFin(),
                $reservation->getSuite(),
                $reservation->getEtablissement(),
            );


            $bookingEvent->setUrl(
                $this->router->generate('booking_show', [
                    'id' => $reservationRepository->getId(),
                ])
            );

            // finally, add the booking to the CalendarEvent for displaying on the calendar
            $calendar->addEvent($bookingEvent);
        }
    }
}