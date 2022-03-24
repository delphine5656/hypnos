<?php

namespace App\Entity;

use App\Repository\EtablissementRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;
use Symfony\Component\Validator\Constraints\DateTime;


/**
 * @ORM\Entity(repositoryClass=EtablissementRepository::class)
 * @Vich\Uploadable()
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
     * @ORM\Column(type="string", length=255)
     */
    private $thumbnail;

    /**
     * @Vich\UploadableField(mapping="thumbnails", fileNameProperty="thumbnail")
     */
    private $thumbnailFile;

    /**
     * @ORM\Column(type="datetime")
     * @var \DateTime
     */
    private $updatedAt;

    public function __toString()
    {
        return $this->getName();
    }

    /**
     * @return mixed
     */
    public function getThumbnailFile()
    {
        return $this->thumbnailFile;
    }

    /**
     * @param mixed $thumbnailFile
     */
    public function setThumbnailFile($thumbnailFile): void
    {
        $this->thumbnailFile = $thumbnailFile;

        if ($thumbnailFile) {
            $this->updatedAt = new \DateTime();
        }
    }

    /**
     * @return mixed
     */
    public function getThumbnail()
    {
        return $this->thumbnail;
    }

    /**
     * @param mixed $thumbnail
     */
    public function setThumbnail($thumbnail): void
    {
        $this->thumbnail = $thumbnail;
    }

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

    /**
     * @ORM\ManyToOne(targetEntity=Ville::class, inversedBy="etablissements")
     * @ORM\JoinColumn(nullable=false)
     */
    private $villes;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $slug;

    /**
     * @ORM\Column(type="text")
     */
    private $shortDescription;



    public function __construct()
    {
        $this->suites = new ArrayCollection();

        $this->updatedAt = new \DateTime();

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

    public function setUpdatedAt(?\DateTimeInterface $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getVilles(): ?Ville
    {
        return $this->villes;
    }

    public function setVilles(?Ville $villes): self
    {
        $this->villes = $villes;

        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): self
    {
        $this->slug = $slug;

        return $this;
    }

    public function getShortDescription(): ?string
    {
        return $this->shortDescription;
    }

    public function setShortDescription(string $shortDescription): self
    {
        $this->shortDescription = $shortDescription;

        return $this;
    }
}
