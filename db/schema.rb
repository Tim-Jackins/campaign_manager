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

ActiveRecord::Schema.define(version: 2020_01_12_021346) do

  create_table "ability_scores", force: :cascade do |t|
    t.string "name"
    t.string "full_name"
    t.text "description"
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
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "location_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_buildings_on_location_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.text "general_information"
    t.text "regional_information"
    t.text "backstory"
    t.text "rules"
    t.text "notes"
    t.integer "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_campaigns_on_creator_id"
  end

  create_table "challenge_ratings", force: :cascade do |t|
    t.string "rating"
    t.integer "xp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "char_classes", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.integer "character_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_char_classes_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.integer "creator_id"
    t.integer "alignment_id"
    t.string "name"
    t.string "background"
    t.string "player_name"
    t.string "race"
    t.integer "xp"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "wisdom"
    t.integer "intelligence"
    t.integer "charisma"
    t.boolean "strength_save"
    t.boolean "dexterity_save"
    t.boolean "constitution_save"
    t.boolean "wisdom_save"
    t.boolean "intelligence_save"
    t.boolean "charisma_save"
    t.boolean "inspiration"
    t.integer "proficiency_bonus"
    t.integer "armor_class"
    t.integer "initiative"
    t.integer "speed"
    t.integer "hp_max"
    t.integer "current_hp"
    t.integer "temporary_hp"
    t.string "hit_dice"
    t.integer "death_saves_success"
    t.integer "death_saves_failure"
    t.text "attack_json"
    t.text "attack_desc"
    t.text "proficiency_language_desc"
    t.integer "copper_pieces"
    t.integer "silver_pieces"
    t.integer "electrum_pieces"
    t.integer "gold_pieces"
    t.integer "platinum_pieces"
    t.integer "features_traits"
    t.text "features_traits_desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alignment_id"], name: "index_characters_on_alignment_id"
    t.index ["creator_id"], name: "index_characters_on_creator_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "creatures", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.string "body_type"
    t.string "sub_body_type"
    t.string "tag"
    t.string "alignment"
    t.integer "armor_class"
    t.string "armor_name"
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
    t.integer "strength_save"
    t.integer "dexterity_save"
    t.integer "constitution_save"
    t.integer "intelligence_save"
    t.integer "wisdom_save"
    t.integer "charisma_save"
    t.string "damage_vulnerabilities"
    t.string "damage_resistances"
    t.string "damage_immunities"
    t.string "condition_immunities"
    t.integer "blindsight"
    t.integer "darkvision"
    t.integer "tremorsense"
    t.integer "truesight"
    t.integer "telepathy"
    t.integer "challenge_rating"
    t.string "skills"
    t.string "languages"
    t.text "spells_json"
    t.text "actions_json"
    t.text "special_abilities_json"
    t.text "reactions_json"
    t.text "legendary_desc"
    t.text "legendary_actions_json"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "damage_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "drops", force: :cascade do |t|
    t.integer "money"
    t.boolean "fof"
    t.integer "creature_id"
    t.integer "items_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creature_id"], name: "index_drops_on_creature_id"
    t.index ["items_id"], name: "index_drops_on_items_id"
  end

  create_table "dungeons", force: :cascade do |t|
    t.string "name"
    t.text "rooms"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "dungeonable_type"
    t.integer "dungeonable_id"
    t.index ["dungeonable_type", "dungeonable_id"], name: "index_dungeons_on_dungeonable_type_and_dungeonable_id"
  end

  create_table "encounters", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.string "type"
    t.string "reward"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encounterable_type"
    t.integer "encounterable_id"
    t.index ["encounterable_type", "encounterable_id"], name: "index_encounters_on_encounterable_type_and_encounterable_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "cost"
    t.text "item_category"
    t.integer "weight"
    t.string "damage_dice"
    t.string "damage_type"
    t.integer "range_short"
    t.integer "range_long"
    t.text "weapon_properties"
    t.integer "throw_range_short"
    t.integer "throw_range_long"
    t.text "armor_class_json"
    t.text "str_minimum"
    t.text "stealth_disadvantage"
    t.string "gear_category"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "script"
    t.string "typical_speakers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "short_description"
    t.text "description"
    t.boolean "is_natural"
    t.integer "campaign_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_locations_on_campaign_id"
  end

  create_table "main_quests", force: :cascade do |t|
    t.string "name"
    t.string "short_description"
    t.text "description"
    t.integer "campaign_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_main_quests_on_campaign_id"
  end

  create_table "quests", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.text "description"
    t.string "reward"
    t.integer "main_quest_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "questable_type"
    t.integer "questable_id"
    t.index ["main_quest_id"], name: "index_quests_on_main_quest_id"
    t.index ["questable_type", "questable_id"], name: "index_quests_on_questable_type_and_questable_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "ability_score_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ability_score_id"], name: "index_skills_on_ability_score_id"
  end

  create_table "spells", force: :cascade do |t|
    t.string "name"
    t.text "description"
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
    t.string "first_name"
    t.string "last_name"
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "weapon_properties", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "buildings", "locations"
  add_foreign_key "campaigns", "users", column: "creator_id"
  add_foreign_key "char_classes", "characters"
  add_foreign_key "characters", "alignment_choices", column: "alignment_id"
  add_foreign_key "characters", "users", column: "creator_id"
  add_foreign_key "drops", "creatures"
  add_foreign_key "drops", "items", column: "items_id"
  add_foreign_key "locations", "campaigns"
  add_foreign_key "main_quests", "campaigns"
  add_foreign_key "quests", "main_quests"
  add_foreign_key "skills", "ability_scores"
end
