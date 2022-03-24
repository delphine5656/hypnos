<?php

namespace App\Form;

use App\Entity\Contact;
use App\Entity\Subject;
use Doctrine\ORM\Mapping\Entity;
use EasyCorp\Bundle\EasyAdminBundle\Filter\ChoiceFilter;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name',  TextType::class, [
                'label' => 'Votre nom',
                'constraints' => new Length([
                    'min' => 2,
                    'max' => 30
                ]),
                'attr' => [
                    'placeholder'=> 'saisissez votre nom',
                    'class' => 'form-control'
                ]
            ])
            ->add('email', EmailType::class, [
                'label' => 'Votre email',
                'attr' => [
                    'placeholder'=> 'saisissez votre email',
                    'class' => 'form-control'
                ]
            ])
            ->add('phone',  TextType::class, [
                'label' => 'Votre téléphone',
                'constraints' => new Length([
                    'min' => 5,
                    'max' => 19
                ]),
                'attr' => [
                    'placeholder'=> 'saisissez votre téléphone',
                    'class' => 'form-control'
                ]
            ])
            ->add('subject')
            ->add('content',  TextareaType::class, [
                'label' => 'Votre message',
                'attr' => [
                    'placeholder'=> 'saisissez votre message',
                    'class' => 'form-control'
                ]
            ])

        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Contact::class,
        ]);
    }
}
