use utf8;
package DoctorWho::Schema::Result::Season;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DoctorWho::Schema::Result::Season

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

=head1 TABLE: C<season>

=cut

__PACKAGE__->table("season");

=head1 ACCESSORS

=head2 season_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 season_number

  data_type: 'integer'
  is_nullable: 0

=head2 start_date

  data_type: 'date'
  is_nullable: 1

=head2 end_date

  data_type: 'date'
  is_nullable: 1

=head2 main_doctor_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "season_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "season_number",
  { data_type => "integer", is_nullable => 0 },
  "start_date",
  { data_type => "date", is_nullable => 1 },
  "end_date",
  { data_type => "date", is_nullable => 1 },
  "main_doctor_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</season_id>

=back

=cut

__PACKAGE__->set_primary_key("season_id");

=head1 RELATIONS

=head2 main_doctor

Type: belongs_to

Related object: L<DoctorWho::Schema::Result::Doctor>

=cut

__PACKAGE__->belongs_to(
  "main_doctor",
  "DoctorWho::Schema::Result::Doctor",
  { doctor_id => "main_doctor_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 stories

Type: has_many

Related object: L<DoctorWho::Schema::Result::Story>

=cut

__PACKAGE__->has_many(
  "stories",
  "DoctorWho::Schema::Result::Story",
  { "foreign.season_id" => "self.season_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2024-11-21 14:58:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5Tb9n+XI0ytRkyIc0ErL6Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
