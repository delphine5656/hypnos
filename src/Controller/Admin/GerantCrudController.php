<?php

namespace App\Controller\Admin;

use App\Entity\Gerant;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CollectionField;
use EasyCorp\Bundle\EasyAdminBundle\Field\EmailField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class GerantCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Gerant::class;
    }


    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            EmailField::new('email'),
            TextField::new('password'),
            AssociationField::new('etablissement'),
            AssociationField::new('suite'),
            TextField::new('firstname'),
            TextField::new('lastname')
        ];
    }

}
