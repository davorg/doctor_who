use utf8;
package DoctorWho::Schema::Result::DoctorActor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DoctorWho::Schema::Result::DoctorActor

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<doctor_actor>

=cut

__PACKAGE__->table("doctor_actor");

=head1 ACCESSORS

=head2 doctor_actor_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 doctor_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 actor_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 start_date

  data_type: 'date'
  is_nullable: 1

=head2 end_date

  data_type: 'date'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "doctor_actor_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "doctor_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "actor_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "start_date",
  { data_type => "date", is_nullable => 1 },
  "end_date",
  { data_type => "date", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</doctor_actor_id>

=back

=cut

__PACKAGE__->set_primary_key("doctor_actor_id");

=head1 RELATIONS

=head2 actor

Type: belongs_to

Related object: L<DoctorWho::Schema::Result::Actor>

=cut

__PACKAGE__->belongs_to(
  "actor",
  "DoctorWho::Schema::Result::Actor",
  { actor_id => "actor_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 doctor

Type: belongs_to

Related object: L<DoctorWho::Schema::Result::Doctor>

=cut

__PACKAGE__->belongs_to(
  "doctor",
  "DoctorWho::Schema::Result::Doctor",
  { doctor_id => "doctor_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2024-11-21 14:58:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aLIfTB1DPOchr5g9LLXteA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
