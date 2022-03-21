<?php

namespace App\Entity;

use App\Repository\EtablissementRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=EtablissementRepository::class)
 */
class Etablissement
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\Column(type="text")
     */
    private $adress;

    /**
     * @ORM\Column(type="text")
     */
    private $description;

    /**
     * @ORM\Column(type="integer")
     */
    private $nombreSuite;

    /**
     * @ORM\OneToMany(targetEntity=Suite::class, mappedBy="etablissement")
     */
    private $suites;

    /**
     * @ORM\OneToOne(targetEntity=Gerant::class, mappedBy="etablissement", cascade={"persist", "remove"})
     */
    private $gerant;

    public function __construct()
    {
        $this->suites = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getAdress(): ?string
    {
        return $this->adress;
    }

    public function setAdress(string $adress): self
    {
        $this->adress = $adress;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getNombreSuite(): ?int
    {
        return $this->nombreSuite;
    }

    public function setNombreSuite(int $nombreSuite): self
    {
        $this->nombreSuite = $nombreSuite;

        return $this;
    }

    /**
     * @return Collection<int, Suite>
     */
    public function getSuites(): Collection
    {
        return $this->suites;
    }

    public function addSuite(Suite $suite): self
    {
        if (!$this->suites->contains($suite)) {
            $this->suites[] = $suite;
            $suite->setEtablissement($this);
        }

        return $this;
    }

    public function removeSuite(Suite $suite): self
    {
        if ($this->suites->removeElement($suite)) {
            // set the owning side to null (unless already changed)
            if ($suite->getEtablissement() === $this) {
                $suite->setEtablissement(null);
            }
        }

        return $this;
    }

    public function getGerant(): ?Gerant
    {
        return $this->gerant;
    }

    public function setGerant(Gerant $gerant): self
    {
        // set the owning side of the relation if necessary
        if ($gerant->getEtablissement() !== $this) {
            $gerant->setEtablissement($this);
        }

        $this->gerant = $gerant;

        return $this;
    }
}
