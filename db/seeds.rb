# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories =
  Category.create(
    [
      { name: 'Family' },
      { name: 'Friend' },
      { name: 'Professional' },
      { name: 'Other' },
    ],
  )
family, friend, professional, other = categories

common_interests =
  CommonInterest.create(
    [
      { name: 'World Domination' },
      { name: 'Chaos' },
      { name: 'Murder' },
      { name: 'Playing Dress Up' },
    ],
  )
world_domination, chaos, murder, dress_up = common_interests

contacts =
  Contact.create(
    [
      {
        name: 'Shigaraki Tomura',
        category: friend,
        common_interests: [chaos, murder, dress_up],
      },
      { name: 'Stain', category: other, common_interests: [murder, dress_up] },
      {
        name: 'Hisoka Morrow',
        category: friend,
        common_interests: [chaos, murder, dress_up],
      },
      {
        name: 'Lelouch vi Britannia',
        category: family,
        common_interests: [world_domination, dress_up],
      },
      {
        name: 'Light Yagami',
        category: professional,
        common_interests: [world_domination, murder],
      },
    ],
  )
shigaraki, stain, hisoka, lelouch, light = contacts

ContactGroup.create(
  [
    { name: 'God Complex', contacts: [lelouch, light] },
    { name: 'Boku no Hero Academia', contacts: [shigaraki, stain] },
  ],
)
