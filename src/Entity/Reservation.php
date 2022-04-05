<?php

namespace App\Entity;

use App\Repository\ReservationRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ORM\Entity(repositoryClass=ReservationRepository::class)
 */
class Reservation
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="date")
     * @Assert\GreaterThan("today")
     */
    private $dateDebut;

    /**
     * @ORM\Column(type="date")
     * @Assert\Expression(
     *     "this.getDateDebut() < this.getDateFin()",
     *     message="La date fin ne doit pas être antérieure à la date début"
     * )
     */
    private $dateFin;

    /**
     * @ORM\ManyToMany(targetEntity=Suite::class, inversedBy="reservations")
     */
    private $suite;

    /**
     * @ORM\ManyToOne(targetEntity=Suite::class, inversedBy="reservation")
     */
    private $suites;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="reservations")
     */
    private $user;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $decription;

    /**
     * @ORM\Column(type="boolean")
     */
    private $all_day;


    /**
     * @ORM\Column(type="string", length=255, nullable=false)
     */
    private $titre;

    /**
     * @ORM\ManyToOne(targetEntity=Etablissement::class, inversedBy="reservations")
     * @ORM\JoinColumn(nullable=true)
     */
    private $etablissement;

    public function __construct()
    {
        $this->suite = new ArrayCollection();

    }

    public function __toString()
    {
        return $this->getTitre();
    }


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDateDebut(): ?\DateTimeInterface
    {
        return $this->dateDebut;
    }

    public function setDateDebut(\DateTimeInterface $dateDebut): self
    {
        $this->dateDebut = $dateDebut;

        return $this;
    }

    public function getDateFin(): ?\DateTimeInterface
    {
        return $this->dateFin;
    }

    public function setDateFin(\DateTimeInterface $dateFin): self
    {
        $this->dateFin = $dateFin;

        return $this;
    }

    /**
     * @return Collection<int, Suite>
     */
    public function getSuite(): Collection
    {
        return $this->suite;
    }

    public function addSuite(Suite $suite): self
    {
        if (!$this->suite->contains($suite)) {
            $this->suite[] = $suite;
        }

        return $this;
    }

    public function removeSuite(Suite $suite): self
    {
        $this->suite->removeElement($suite);

        return $this;
    }

    public function getSuites(): ?Suite
    {
        return $this->suites;
    }

    public function setSuites(?Suite $suites): self
    {
        $this->suites = $suites;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): self
    {
        $this->user = $user;

        return $this;
    }

    public function getDecription(): ?string
    {
        return $this->decription;
    }

    public function setDecription(?string $decription): self
    {
        $this->decription = $decription;

        return $this;
    }

    public function getAllDay(): ?bool
    {
        return $this->all_day;
    }

    public function setAllDay(bool $all_day): self
    {
        $this->all_day = $all_day;

        return $this;
    }



    public function getTitre(): ?string
    {
        return $this->titre;
    }

    public function setTitre(?string $titre): self
    {
        $this->titre = $titre;

        return $this;
    }

    public function getEtablissement(): ?Etablissement
    {
        return $this->etablissement;
    }

    public function setEtablissement(?Etablissement $etablissement): self
    {
        $this->etablissement = $etablissement;

        return $this;
    }

    /**
     * Permet de savoir si les dates réservées sont disponibles ou non
     *
     * @return boolean
     */
    public function isBookableDates() {
        // 1) Il faut connaitre les dates qui sont impossibles pour l'annonce
        $notAvailableDays = $this->suites->getNotAvailableDays();
        // 2) Il faut comparer les dates choisies avec les dates impossibles
        $bookingDays      = $this->getDays();

        $formatDay = function($day){
            return $day->format('Y-m-d');
        };

        // Tableau des chaines de caractères de mes journées
        $days           = array_map($formatDay, $bookingDays);
        $notAvailable   = array_map($formatDay, $notAvailableDays);

        foreach($days as $day) {
            if(array_search($day, $notAvailable) !== false) return false;
        }

        return true;
    }

    /**
     * Permet de récupérer un tableau des journées qui correspondent à ma réservation
     *
     * @return array Un tableau d'objets DateTime représentant les jours de la réservation
     */
    public function getDays() {
        $resultat = range(
            $this->dateDebut->getTimestamp(),
            $this->dateFin->getTimestamp(),
            24 * 60 * 60
        );

        $days =  array_map(function($dayTimestamp) {
            return new \DateTime(date('Y-m-d', $dayTimestamp));
        }, $resultat);

        return $days;
    }

    public function getDuration() {
        $diff = $this->dateFin->diff($this->dateDebut);
        return $diff->days;
    }

}
