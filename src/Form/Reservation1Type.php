<?php

namespace App\Form;

use App\Entity\Etablissement;
use App\Entity\Reservation;
use App\Entity\Suite;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;

class Reservation1Type extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('titre', TextType::class, [
                'label' => 'Reservation',
                'constraints' => new Length([
                    'min' => 5,
                    'max' => 19
                ])
            ])

            ->add('dateDebut', DateType::class, [
                'required' => true,
            ])
            ->add('dateFin', DateType::class, [
                'required' => true,
            ])
            ->add('all_day')

            ->add('etablissement', EntityType::class, [
                'mapped' => false,
                'class' => Etablissement::class,
                'choice_label' => function($etablissement){
                    return $etablissement->getName().'('.$etablissement->getVilles().')';
                },
            ])

            ->add('suites', EntityType::class, [
                'class' => Suite::class,
                'choice_label' => function($suites){
                    return $suites->getTitre().'('.$suites->getEtablissement().')';
                },
            ])
        ;

    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Reservation::class,
        ]);
    }
}
