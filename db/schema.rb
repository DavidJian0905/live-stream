# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171118104410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "streams", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "desc"
    t.string   "status"
    t.string   "opentok_session_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id"], name: "index_streams_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "video"
  end

  create_table "wp_commentmeta", primary_key: "meta_id", id: :bigint, default: -> { "nextval(('wp_commentmeta_seq'::text)::regclass)" }, force: :cascade do |t|
    t.bigint "comment_id",             default: 0, null: false
    t.string "meta_key",   limit: 255
    t.text   "meta_value"
    t.index ["comment_id"], name: "wp_commentmeta_comment_id", using: :btree
    t.index ["meta_key"], name: "wp_commentmeta_meta_key", using: :btree
  end

  create_table "wp_comments", primary_key: "comment_ID", id: :bigint, default: -> { "nextval(('wp_comments_seq'::text)::regclass)" }, force: :cascade do |t|
    t.bigint   "comment_post_ID",                  default: 0,                                     null: false
    t.text     "comment_author",                                                                   null: false
    t.string   "comment_author_email", limit: 100, default: "",                                    null: false
    t.string   "comment_author_url",   limit: 200, default: "",                                    null: false
    t.string   "comment_author_ip",    limit: 100, default: "",                                    null: false
    t.datetime "comment_date",                     default: -> { "now()" },                        null: false
    t.datetime "comment_date_gmt",                 default: -> { "timezone('gmt'::text, now())" }, null: false
    t.text     "comment_content",                                                                  null: false
    t.integer  "comment_karma",                    default: 0,                                     null: false
    t.string   "comment_approved",     limit: 20,  default: "1",                                   null: false
    t.string   "comment_agent",        limit: 255, default: "",                                    null: false
    t.string   "comment_type",         limit: 20,  default: "",                                    null: false
    t.bigint   "comment_parent",                   default: 0,                                     null: false
    t.bigint   "user_id",                          default: 0,                                     null: false
    t.index ["comment_approved", "comment_date_gmt"], name: "wp_comments_comment_approved_date_gmt", using: :btree
    t.index ["comment_author_email"], name: "wp_comments_comment_author_email", using: :btree
    t.index ["comment_date_gmt"], name: "wp_comments_comment_date_gmt", using: :btree
    t.index ["comment_parent"], name: "wp_comments_comment_parent", using: :btree
    t.index ["comment_post_ID"], name: "wp_comments_comment_post_ID", using: :btree
  end

  create_table "wp_links", primary_key: "link_id", id: :bigint, default: -> { "nextval(('wp_links_seq'::text)::regclass)" }, force: :cascade do |t|
    t.string   "link_url",         limit: 255, default: "",             null: false
    t.string   "link_name",        limit: 255, default: "",             null: false
    t.string   "link_image",       limit: 255, default: "",             null: false
    t.string   "link_target",      limit: 25,  default: "",             null: false
    t.string   "link_description", limit: 255, default: "",             null: false
    t.string   "link_visible",     limit: 20,  default: "Y",            null: false
    t.bigint   "link_owner",                   default: 1,              null: false
    t.integer  "link_rating",                  default: 0,              null: false
    t.datetime "link_updated",                 default: -> { "now()" }, null: false
    t.string   "link_rel",         limit: 255, default: "",             null: false
    t.text     "link_notes",                                            null: false
    t.string   "link_rss",         limit: 255, default: "",             null: false
    t.index ["link_visible"], name: "wp_links_link_visible", using: :btree
  end

  create_table "wp_options", primary_key: "option_id", id: :bigint, default: -> { "nextval(('wp_options_seq'::text)::regclass)" }, force: :cascade do |t|
    t.string "option_name",  limit: 64, default: "",    null: false
    t.text   "option_value",                            null: false
    t.string "autoload",     limit: 20, default: "yes", null: false
    t.index ["option_name"], name: "wp_options_option_name", unique: true, using: :btree
  end

  create_table "wp_postmeta", primary_key: "meta_id", id: :bigint, default: -> { "nextval(('wp_postmeta_seq'::text)::regclass)" }, force: :cascade do |t|
    t.bigint "post_id",                default: 0, null: false
    t.string "meta_key",   limit: 255
    t.text   "meta_value"
    t.index ["meta_key"], name: "wp_postmeta_meta_key", using: :btree
    t.index ["post_id"], name: "wp_postmeta_post_id", using: :btree
  end

  create_table "wp_posts", primary_key: "ID", id: :bigint, default: -> { "nextval(('wp_posts_seq'::text)::regclass)" }, force: :cascade do |t|
    t.bigint   "post_author",                       default: 0,                                     null: false
    t.datetime "post_date",                         default: -> { "now()" },                        null: false
    t.datetime "post_date_gmt",                     default: -> { "timezone('gmt'::text, now())" }, null: false
    t.text     "post_content",                                                                      null: false
    t.text     "post_title",                                                                        null: false
    t.text     "post_excerpt",                                                                      null: false
    t.string   "post_status",           limit: 20,  default: "publish",                             null: false
    t.string   "comment_status",        limit: 20,  default: "open",                                null: false
    t.string   "ping_status",           limit: 20,  default: "open",                                null: false
    t.string   "post_password",         limit: 20,  default: "",                                    null: false
    t.string   "post_name",             limit: 200, default: "",                                    null: false
    t.text     "to_ping",                                                                           null: false
    t.text     "pinged",                                                                            null: false
    t.datetime "post_modified",                     default: -> { "now()" },                        null: false
    t.datetime "post_modified_gmt",                 default: -> { "timezone('gmt'::text, now())" }, null: false
    t.text     "post_content_filtered",                                                             null: false
    t.bigint   "post_parent",                       default: 0,                                     null: false
    t.string   "guid",                  limit: 255, default: "",                                    null: false
    t.integer  "menu_order",                        default: 0,                                     null: false
    t.string   "post_type",             limit: 20,  default: "post",                                null: false
    t.string   "post_mime_type",        limit: 100, default: "",                                    null: false
    t.bigint   "comment_count",                     default: 0,                                     null: false
    t.index ["post_author"], name: "wp_posts_post_author", using: :btree
    t.index ["post_name"], name: "wp_posts_post_name", using: :btree
    t.index ["post_parent"], name: "wp_posts_post_parent", using: :btree
    t.index ["post_type", "post_status", "post_date", "ID"], name: "wp_posts_type_status_date", using: :btree
  end

  create_table "wp_term_relationships", primary_key: ["object_id", "term_taxonomy_id"], force: :cascade do |t|
    t.bigint  "object_id",        default: 0, null: false
    t.bigint  "term_taxonomy_id", default: 0, null: false
    t.integer "term_order",       default: 0, null: false
    t.index ["term_taxonomy_id"], name: "wp_term_relationships_term_taxonomy_id", using: :btree
  end

  create_table "wp_term_taxonomy", primary_key: "term_taxonomy_id", id: :bigint, default: -> { "nextval(('wp_term_taxonomy_seq'::text)::regclass)" }, force: :cascade do |t|
    t.bigint "term_id",                default: 0,  null: false
    t.string "taxonomy",    limit: 32, default: "", null: false
    t.text   "description",                         null: false
    t.bigint "parent",                 default: 0,  null: false
    t.bigint "count",                  default: 0,  null: false
    t.index ["taxonomy"], name: "wp_term_taxonomy_taxonomy", using: :btree
    t.index ["term_id", "taxonomy"], name: "wp_term_taxonomy_term_id_taxonomy", unique: true, using: :btree
  end

  create_table "wp_terms", primary_key: "term_id", id: :bigint, default: -> { "nextval(('wp_terms_seq'::text)::regclass)" }, force: :cascade do |t|
    t.string  "name",       limit: 200, default: "", null: false
    t.string  "slug",       limit: 200, default: "", null: false
    t.integer "term_group",             default: 0,  null: false
    t.index ["name"], name: "wp_terms_name", using: :btree
    t.index ["slug"], name: "wp_terms_slug", using: :btree
  end

  create_table "wp_usermeta", primary_key: "umeta_id", id: :bigint, default: -> { "nextval(('wp_usermeta_seq'::text)::regclass)" }, force: :cascade do |t|
    t.bigint "user_id",                default: 0, null: false
    t.string "meta_key",   limit: 255
    t.text   "meta_value"
    t.index ["meta_key"], name: "wp_usermeta_meta_key", using: :btree
    t.index ["user_id"], name: "wp_usermeta_user_id", using: :btree
  end

  create_table "wp_users", primary_key: "ID", id: :bigint, default: -> { "nextval(('wp_users_seq'::text)::regclass)" }, force: :cascade do |t|
    t.string   "user_login",          limit: 60,  default: "",             null: false
    t.string   "user_pass",           limit: 64,  default: "",             null: false
    t.string   "user_nicename",       limit: 50,  default: "",             null: false
    t.string   "user_email",          limit: 100, default: "",             null: false
    t.string   "user_url",            limit: 100, default: "",             null: false
    t.datetime "user_registered",                 default: -> { "now()" }, null: false
    t.string   "user_activation_key", limit: 60,  default: "",             null: false
    t.integer  "user_status",                     default: 0,              null: false
    t.string   "display_name",        limit: 250, default: "",             null: false
    t.index ["user_login"], name: "wp_users_user_login_key", using: :btree
    t.index ["user_nicename"], name: "wp_users_user_nicename", using: :btree
  end

end
