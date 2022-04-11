<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\ReservationRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * @ApiResource()
 * @ORM\Entity(repositoryClass=ReservationRepository::class)
 */
class Reservation
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     * @Groups({"listeReservation"})
     */
    private $id;


    /**
     * @ORM\Column(type="date")
     * @Assert\GreaterThan("today")
     * @Groups({"listeReservation"})
     */
    private $dateDebut;

    /**
     * @ORM\Column(type="date")
     * @Assert\Expression(
     *     "this.getDateDebut() < this.getDateFin()",
     *     message="La date fin ne doit pas être antérieure à la date début"
     * )
     * @Groups({"listeReservation"})
     */
    private $dateFin;

    /**
     * @ORM\ManyToMany(targetEntity=Suite::class, inversedBy="reservations")
     *  @Groups({"listeReservation"})
     */
    private $suite;

    /**
     * @ORM\ManyToOne(targetEntity=Suite::class, inversedBy="reservation")
     * @Groups({"listeReservation"})
     */
    private $suites;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="reservations")
     * @Groups({"listeReservation"})
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
     * @Groups({"listeReservation"})
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



}
