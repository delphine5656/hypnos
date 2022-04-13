<?php

namespace App\Repository;

use App\Entity\Reservation;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Reservation|null find($id, $lockMode = null, $lockVersion = null)
 * @method Reservation|null findOneBy(array $criteria, array $orderBy = null)
 * @method Reservation[]    findAll()
 * @method Reservation[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReservationRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Reservation::class);
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function add(Reservation $entity, bool $flush = true): void
    {
        $this->_em->persist($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function remove(Reservation $entity, bool $flush = true): void
    {
        $this->_em->remove($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    public function findExistingBookings(array $booking)
    {
        $beginAt = \DateTimeImmutable::createFromFormat(
            'd/m/Y',
            $booking['beginAt']['day']
        );
        $endAt = \DateTimeImmutable::createFromFormat(
            'd/m/Y',
            $booking['endAt']['day']
        );

        $qb = $this->createQueryBuilder('b')
            ->innerJoin('b.suite', 's')
            ->innerJoin('b.hotel', 'h')
            ->where('h = :hotel_id')
            ->andWhere('s = :suite_id')
            ->andWhere('(b.beginAt BETWEEN :begin_at_from AND :begin_at_to) OR (b.endAt BETWEEN :end_at_from AND :end_at_to)')
            ->setParameter('hotel_id', (int) $booking['hotel'])
            ->setParameter('suite_id', (int) $booking['suite'])
            ->setParameter('begin_at_from', $beginAt)
            ->setParameter('begin_at_to', $endAt)
            ->setParameter('end_at_from', $beginAt)
            ->setParameter('end_at_to', $endAt)
        ;

        $query = $qb->getQuery();

        return $query->getResult();
    }
    // /**
    //  * @return Reservation[] Returns an array of Reservation objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('r.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Reservation
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */




}
