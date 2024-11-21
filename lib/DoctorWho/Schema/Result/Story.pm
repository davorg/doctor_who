use utf8;
package DoctorWho::Schema::Result::Story;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DoctorWho::Schema::Result::Story

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

=head1 TABLE: C<story>

=cut

__PACKAGE__->table("story");

=head1 ACCESSORS

=head2 story_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'text'
  is_nullable: 0

=head2 season_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 number_in_season

  data_type: 'integer'
  is_nullable: 0

=head2 main_doctor_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "story_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "text", is_nullable => 0 },
  "season_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "number_in_season",
  { data_type => "integer", is_nullable => 0 },
  "main_doctor_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</story_id>

=back

=cut

__PACKAGE__->set_primary_key("story_id");

=head1 RELATIONS

=head2 companion_appearances

Type: has_many

Related object: L<DoctorWho::Schema::Result::CompanionAppearance>

=cut

__PACKAGE__->has_many(
  "companion_appearances",
  "DoctorWho::Schema::Result::CompanionAppearance",
  { "foreign.story_id" => "self.story_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 episodes

Type: has_many

Related object: L<DoctorWho::Schema::Result::Episode>

=cut

__PACKAGE__->has_many(
  "episodes",
  "DoctorWho::Schema::Result::Episode",
  { "foreign.story_id" => "self.story_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 main_doctor

Type: belongs_to

Related object: L<DoctorWho::Schema::Result::Doctor>

=cut

__PACKAGE__->belongs_to(
  "main_doctor",
  "DoctorWho::Schema::Result::Doctor",
  { doctor_id => "main_doctor_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 season

Type: belongs_to

Related object: L<DoctorWho::Schema::Result::Season>

=cut

__PACKAGE__->belongs_to(
  "season",
  "DoctorWho::Schema::Result::Season",
  { season_id => "season_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2024-11-21 14:58:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UzNGufbvmr2/yw4dz9qC3w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
