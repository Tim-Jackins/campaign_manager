# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_09_225803) do

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ability_scores", force: :cascade do |t|
    t.string "name"
    t.string "full_name"
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "actions", force: :cascade do |t|
    t.string "damage_dice"
    t.string "attack_bonus"
    t.string "name"
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "alignment_choices", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "api_resources", force: :cascade do |t|
    t.string "base_url"
    t.string "path"
    t.integer "api_id"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.integer "locations_id", null: false
    t.integer "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["locations_id"], name: "index_campaigns_on_locations_id"
    t.index ["owner_id"], name: "index_campaigns_on_owner_id"
  end

  create_table "challenge_ratings", force: :cascade do |t|
    t.string "rating"
    t.integer "xp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "creatures", force: :cascade do |t|
    t.boolean "fof"
    t.string "name"
    t.string "size"
    t.string "type"
    t.string "tag"
    t.string "alignment"
    t.integer "armor_class"
    t.integer "hit_points"
    t.string "hit_dice"
    t.integer "speed"
    t.integer "burrow_speed"
    t.integer "climb_speed"
    t.integer "fly_speed"
    t.integer "swim_speed"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
    t.integer "damage_vulnerabilities_id"
    t.integer "damage_resistances_id"
    t.integer "damage_immunities_id"
    t.integer "condition_immunities_id"
    t.integer "blindsight"
    t.integer "darkvision"
    t.integer "tremorsense"
    t.integer "truesight"
    t.integer "telepathy"
    t.integer "challenge_rating"
    t.integer "skills_id"
    t.integer "languages_id"
    t.integer "saving_throws_id"
    t.integer "special_abilities_id", null: false
    t.integer "actions_id", null: false
    t.integer "legendary_actions_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actions_id"], name: "index_creatures_on_actions_id"
    t.index ["condition_immunities_id"], name: "index_creatures_on_condition_immunities_id"
    t.index ["damage_immunities_id"], name: "index_creatures_on_damage_immunities_id"
    t.index ["damage_resistances_id"], name: "index_creatures_on_damage_resistances_id"
    t.index ["damage_vulnerabilities_id"], name: "index_creatures_on_damage_vulnerabilities_id"
    t.index ["languages_id"], name: "index_creatures_on_languages_id"
    t.index ["legendary_actions_id"], name: "index_creatures_on_legendary_actions_id"
    t.index ["saving_throws_id"], name: "index_creatures_on_saving_throws_id"
    t.index ["skills_id"], name: "index_creatures_on_skills_id"
    t.index ["special_abilities_id"], name: "index_creatures_on_special_abilities_id"
  end

  create_table "damage_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "drops", force: :cascade do |t|
    t.integer "money"
    t.integer "items_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["items_id"], name: "index_drops_on_items_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "cost"
    t.string "item_category"
    t.text "category_specific_info"
    t.integer "api_resource_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["api_resource_id"], name: "index_items_on_api_resource_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "script"
    t.string "typical_speakers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "legendary_actions", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "npcs_id"
    t.integer "monsters_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["monsters_id"], name: "index_locations_on_monsters_id"
    t.index ["npcs_id"], name: "index_locations_on_npcs_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "area"
    t.integer "location_id"
    t.integer "creature_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creature_id"], name: "index_monsters_on_creature_id"
    t.index ["location_id"], name: "index_monsters_on_location_id"
  end

  create_table "npcs", force: :cascade do |t|
    t.string "area"
    t.integer "location_id"
    t.integer "creature_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creature_id"], name: "index_npcs_on_creature_id"
    t.index ["location_id"], name: "index_npcs_on_location_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.integer "ability_score_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ability_score_id"], name: "index_skills_on_ability_score_id"
  end

  create_table "spells", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.text "higher_level"
    t.string "page"
    t.string "range"
    t.string "components"
    t.text "material"
    t.text "ritual"
    t.string "duration"
    t.text "concentration"
    t.string "casting_time"
    t.integer "level"
    t.string "school"
    t.string "classes"
    t.string "circles"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "campaigns", "locations", column: "locations_id"
  add_foreign_key "campaigns", "user", column: "owner_id"
  add_foreign_key "creatures", "ability_score", column: "saving_throws_id"
  add_foreign_key "creatures", "actions", column: "actions_id"
  add_foreign_key "creatures", "condition_immunities", column: "condition_immunities_id"
  add_foreign_key "creatures", "damage_immunities", column: "damage_immunities_id"
  add_foreign_key "creatures", "damage_resistances", column: "damage_resistances_id"
  add_foreign_key "creatures", "damage_vulnerabilities", column: "damage_vulnerabilities_id"
  add_foreign_key "creatures", "languages", column: "languages_id"
  add_foreign_key "creatures", "legendary_actions", column: "legendary_actions_id"
  add_foreign_key "creatures", "skills", column: "skills_id"
  add_foreign_key "creatures", "special_abilities", column: "special_abilities_id"
  add_foreign_key "drops", "items", column: "items_id"
  add_foreign_key "items", "api_resources"
  add_foreign_key "locations", "creature", column: "monsters_id"
  add_foreign_key "locations", "creature", column: "npcs_id"
  add_foreign_key "monsters", "creatures"
  add_foreign_key "monsters", "locations"
  add_foreign_key "npcs", "creatures"
  add_foreign_key "npcs", "locations"
  add_foreign_key "skills", "ability_scores"
end
