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

    public function loadEvents(CalendarEvent $calendar): void
    {
        $dateDebut = $calendar->getStart();
        $dateFin = $calendar->getEnd();
        $filters = $calendar->getFilters();

        // Modify the query to fit to your entity and needs
        // Change b.beginAt by your start date in your custom entity
        $reservationRepository = $this->reservationRepository
            ->createQueryBuilder('booking')
            ->where('reservation.dateDebut BETWEEN :dateDebut and :dateFin')
            ->setParameter('dateDebut', $dateDebut->format('Y-m-d H:i:s'))
            ->setParameter('dateFin',$dateFin->format('Y-m-d H:i:s'))
            ->getQuery()
            ->getResult()
        ;

        foreach ($reservationRepository as $reservation) {
            // this create the events with your own entity (here booking entity) to populate calendar
            $bookingEvent = new Event(
                $reservationRepository->getTitre(),
                $reservationRepository->getDateDebut(),
                $reservationRepository->getDateFin() // If the end date is null or not defined, a all day event is created.
            );

            /*
             * Optional calendar event settings
             *
             * For more information see : Toiba\FullCalendarBundle\Entity\Event
             * and : https://fullcalendar.io/docs/event-object
             */
            // $bookingEvent->setUrl('http://www.google.com');
            // $bookingEvent->setBackgroundColor($booking->getColor());
            // $bookingEvent->setCustomField('borderColor', $booking->getColor());

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