<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220317173617 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE reservation ADD suites_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE reservation ADD CONSTRAINT FK_42C84955F452D9C6 FOREIGN KEY (suites_id) REFERENCES suite (id)');
        $this->addSql('CREATE INDEX IDX_42C84955F452D9C6 ON reservation (suites_id)');
        $this->addSql('ALTER TABLE suite ADD etablissement_id INT NOT NULL, ADD ville_id INT NOT NULL');
        $this->addSql('ALTER TABLE suite ADD CONSTRAINT FK_153CE426FF631228 FOREIGN KEY (etablissement_id) REFERENCES etablissement (id)');
        $this->addSql('ALTER TABLE suite ADD CONSTRAINT FK_153CE426A73F0036 FOREIGN KEY (ville_id) REFERENCES ville (id)');
        $this->addSql('CREATE INDEX IDX_153CE426FF631228 ON suite (etablissement_id)');
        $this->addSql('CREATE INDEX IDX_153CE426A73F0036 ON suite (ville_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE etablissement CHANGE name name VARCHAR(255) NOT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE adress adress LONGTEXT NOT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE description description LONGTEXT NOT NULL COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE messenger_messages CHANGE body body LONGTEXT NOT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE headers headers LONGTEXT NOT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE queue_name queue_name VARCHAR(255) NOT NULL COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE reservation DROP FOREIGN KEY FK_42C84955F452D9C6');
        $this->addSql('DROP INDEX IDX_42C84955F452D9C6 ON reservation');
        $this->addSql('ALTER TABLE reservation DROP suites_id');
        $this->addSql('ALTER TABLE suite DROP FOREIGN KEY FK_153CE426FF631228');
        $this->addSql('ALTER TABLE suite DROP FOREIGN KEY FK_153CE426A73F0036');
        $this->addSql('DROP INDEX IDX_153CE426FF631228 ON suite');
        $this->addSql('DROP INDEX IDX_153CE426A73F0036 ON suite');
        $this->addSql('ALTER TABLE suite DROP etablissement_id, DROP ville_id, CHANGE titre titre VARCHAR(255) NOT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE image image VARCHAR(255) NOT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE description description LONGTEXT NOT NULL COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE ville CHANGE name name VARCHAR(255) NOT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE region region VARCHAR(255) NOT NULL COLLATE `utf8mb4_unicode_ci`');
    }
}
