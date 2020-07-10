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

ActiveRecord::Schema.define(version: 2020_07_09_192814) do

  create_table "club_members", force: :cascade do |t|
    t.integer "club_id"
    t.integer "member_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name_of_club"
    t.string "about_club"
    t.integer "current_size"
    t.integer "member_capacity"
    t.string "meetings_day"
    t.integer "attendance"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password"
  end

  create_table "movie_clubs", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "club_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "imbdid"
    t.string "title"
    t.integer "year"
    t.string "rated"
    t.integer "runtime"
    t.string "genre"
    t.string "director"
    t.string "writer"
    t.string "actors"
    t.string "plot"
    t.string "language"
    t.string "country"
    t.string "awards"
    t.string "poster_link"
    t.float "imdb_rating"
    t.string "production"
  end

end
