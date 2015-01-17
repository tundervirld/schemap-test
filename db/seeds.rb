# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_user = User.find_or_create_by(:email => 'admin@example.com') do |user|
  user.password = '12345678'
end
unless Author.exists?
  Author.create([
    {
      name: 'Morgan Kaufmann Publishers',
      date_of_birth:Time.parse("24/08/1951"),
      number_of_books: 15
    },
    {
      name: 'Rick Yancey',
      date_of_birth:Time.parse("14/08/1961"),
      number_of_books: 5
    },
    {
      name: 'Brandon Sanderson',
      date_of_birth:Time.parse("12/08/1973"),
      number_of_books: 18
    },
    {
      name: 'Pawan Vora',
      date_of_birth:Time.parse("08/08/1980"),
      number_of_books: 24
    },
    {
      name: 'Jason Beaird',
      date_of_birth:Time.parse("07/08/1932"),
      number_of_books: 16
    },
    {
      name: 'Jennifer Niederst Robbins',
      date_of_birth:Time.parse("27/08/1947"),
      number_of_books: 12
    },
    {
      name: 'Steve Krug',
      date_of_birth:Time.parse("28/08/1913"),
      number_of_books: 8
    } ,  
    {
      name: 'Orson Scott Card',
      date_of_birth:Time.parse("28/08/1913"),
      number_of_books: 8
    }     
  ])
end
unless Editorial.exists?
  Editorial.create([
    {
      name: 'Ediciones B',
      country:"España",
      created_at: Time.now
    },
    {
      name: 'RBA', 
      country:"Chile",
      created_at: Time.now
    },
    {
      name: 'Morgan Kaufmann Publishers', 
      country:"Ecuador",
      created_at: Time.now
    },
    {
      name: 'SitePoint',
      country:"USA",
      created_at: Time.now
    },
    {
      name: 'O\'Reilly',
      country:"Alemania",
      created_at: Time.now
    },
    {
      name: 'New Riders Publishing',
      country:"India",
      created_at: Time.now
    }
  ])

unless Book.exists?  
  now = Time.now.to_f
  long_ago = 5.years.ago.to_f

  def rtime(now,init_time)
    x_init_time = init_time.to_time.to_f
    Time.at(rand * (now - x_init_time) + x_init_time)
  end
  Book.create([
    {
      title: 'La sombra de Ender',
      #author: 'Orson Scott Card',
      author_ids: 8,
      #editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: "Ender's Shadow",
      translation: 'Rafael Marín',
      edition: 1,
      edition_date: (init_time = Date.parse('2012-01-01')),
      edition_place: 'Barcelona',
      publication_year: 1999,
      isbn: '978-84-9872-591-9',
      created_at: rtime(now,init_time)
    
    },
    {
      title: 'La sombra del Hegemón',
      #author: 'Orson Scott Card',
      author_ids: 8,
     # editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: 'Hegemon\'s Shadow',
      translation: 'Rafael Marín',
      edition: 1,
      edition_date: (init_time = Date.parse('2014-02-01')),
      edition_place: 'Barcelona',
      publication_year: 2001,
      isbn: '978-84-9872-909-2',
      created_at: rtime(now,init_time)
    },
    {
      title: 'La quinta ola',
      #author: 'Rick Yancey',
      author_ids: 2,
      #editorial: 'RBA',
      editorial_id:2,
      original_title: 'The 5th Wave',
      translation: 'Pilar Ramírez Tello',
      edition: 1,
      edition_date: (init_time = Date.parse('2013-09-01')),
      edition_place: 'Barcelona',
      publication_year: 2013,
      isbn: '978-84-272-0422-5',
      created_at: rtime(now,init_time)
    },
    {
      title: 'El imperio final',
     # author: 'Brandon Sanderson',
      author_ids: 3,
      #editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: 'Mistborn',
      translation: 'Rafael Marín Trechera',
      edition: 2,
      edition_date: (init_time = Date.parse('2011-06-01')),
      edition_place: 'Barcelona',
      publication_year: 2007,
      isbn: '978-84-666-3199-0',
      created_at: rtime(now,init_time)
    },
    {
      title: 'El pozo de la ascensión',
      #author: 'Brandon Sanderson',
      author_ids: 3,
      #editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: 'The Well of Ascension: Book Two of Mistborn',
      translation: 'Rafael Marín Trechera',
      edition: 3,
      edition_date: (init_time = Date.parse('2011-06-01')),
      edition_place: 'Barcelona',
      publication_year: 2009,
      isbn: nil,
      created_at: rtime(now,init_time)
    },
    {
      title: 'Web Application Design Patterns',
      #author: 'Pawan Vora',
      author_ids: 4,
      #editorial: 'Morgan Kaufmann Publishers',
      editorial_id: 3,
      original_title: nil,
      translation: nil,
      edition: 1,
      edition_date: nil,
      edition_place: 'Canada',
      publication_year: 2009,
      isbn: '978-0-12-374265-0',
      created_at: rtime(now,Date.parse('2009-06-01'))
    },
    {
      title: 'The principles of Beautiful Web Design',
      #author: 'Jason Beaird',
      author_ids: 5,
      #editorial: 'SitePoint',
      editorial_id: 4,
      original_title: nil,
      translation: nil,
      edition: 2,
      edition_date: (init_time = Date.parse('2010-11-01')),
      edition_place: 'Canada',
      publication_year: 2010,
      isbn: '978-0-9805768-9-4',
      created_at: rtime(now,init_time)
    },
    {
      title: 'Learning Web Design',
      #author: 'Jennifer Niederst Robbins',
      author_ids: 6,
      #editorial: 'O\'Reilly',
      editorial_id: 5,
      original_title: nil,
      translation: nil,
      edition: 3,
      edition_date: (init_time = Date.parse('2007-06-01')),
      edition_place: nil,
      publication_year: 2001,
      isbn: '978-0-596-52752-5',
      created_at: rtime(now,init_time)
    },
    {
      title: 'Don’t Make Me Think!',
      #author: 'Steve Krug',
      author_ids: 7,
      #editorial: 'New Riders Publishing',
      editorial_id: 6,
      original_title: nil,
      translation: nil,
      edition: 2,
      edition_date: (init_time = Date.parse('2006-06-01')),
      edition_place: 'United States of America',
      publication_year: 2006,
      isbn: '0-321-34475-8',
      created_at: rtime(now,init_time)
    },
    {
      title: 'La sombra de Ender 2',
      #author: 'Orson Scott Card',
      author_ids: 8,
      #editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: "Ender's Shadow",
      translation: 'Rafael Marín',
      edition: 1,
      edition_date: (init_time = Date.parse('2012-01-01')),
      edition_place: 'Barcelona',
      publication_year: 1999,
      isbn: '978-84-9872-591-9',
      created_at: rtime(now,init_time)
    
    },
    {
      title: 'La sombra del Hegemón 2',
      #author: 'Orson Scott Card',
      author_ids: 8,
     # editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: 'Hegemon\'s Shadow',
      translation: 'Rafael Marín',
      edition: 1,
      edition_date: (init_time = Date.parse('2014-02-01')),
      edition_place: 'Barcelona',
      publication_year: 2001,
      isbn: '978-84-9872-909-2',
      created_at: rtime(now,init_time)
    },
    {
      title: 'La quinta ola 2',
      #author: 'Rick Yancey',
      author_ids: 2,
      #editorial: 'RBA',
      editorial_id:2,
      original_title: 'The 5th Wave',
      translation: 'Pilar Ramírez Tello',
      edition: 1,
      edition_date: (init_time = Date.parse('2013-09-01')),
      edition_place: 'Barcelona',
      publication_year: 2013,
      isbn: '978-84-272-0422-5',
      created_at: rtime(now,init_time)
    },
    {
      title: 'El imperio final 2',
     # author: 'Brandon Sanderson',
      author_ids: 3,
      #editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: 'Mistborn',
      translation: 'Rafael Marín Trechera',
      edition: 2,
      edition_date: (init_time = Date.parse('2011-06-01')),
      edition_place: 'Barcelona',
      publication_year: 2007,
      isbn: '978-84-666-3199-0',
      created_at: rtime(now,init_time)
    },
    {
      title: 'El pozo de la ascensión 2',
      #author: 'Brandon Sanderson',
      author_ids: 3,
      #editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: 'The Well of Ascension: Book Two of Mistborn',
      translation: 'Rafael Marín Trechera',
      edition: 3,
      edition_date: (init_time = Date.parse('2011-06-01')),
      edition_place: 'Barcelona',
      publication_year: 2009,
      isbn: nil,
      created_at: rtime(now,init_time)
    },
    {
      title: 'Web Application Design Patterns 2',
      #author: 'Pawan Vora',
      author_ids: 4,
      #editorial: 'Morgan Kaufmann Publishers',
      editorial_id: 3,
      original_title: nil,
      translation: nil,
      edition: 1,
      edition_date: nil,
      edition_place: 'Canada',
      publication_year: 2009,
      isbn: '978-0-12-374265-0',
      created_at: rtime(now,Date.parse('2009-06-01'))
    },
    {
      title: 'The principles of Beautiful Web Design 2',
      #author: 'Jason Beaird',
      author_ids: 5,
      #editorial: 'SitePoint',
      editorial_id: 4,
      original_title: nil,
      translation: nil,
      edition: 2,
      edition_date: (init_time = Date.parse('2010-11-01')),
      edition_place: 'Canada',
      publication_year: 2010,
      isbn: '978-0-9805768-9-4',
      created_at: rtime(now,init_time)
    },
    {
      title: 'Learning Web Design 2',
      #author: 'Jennifer Niederst Robbins',
      author_ids: 6,
      #editorial: 'O\'Reilly',
      editorial_id: 5,
      original_title: nil,
      translation: nil,
      edition: 3,
      edition_date: (init_time = Date.parse('2007-06-01')),
      edition_place: nil,
      publication_year: 2001,
      isbn: '978-0-596-52752-5',
      created_at: rtime(now,init_time)
    },
    {
      title: 'Don’t Make Me Think 2!',
      #author: 'Steve Krug',
      author_ids: 7,
      #editorial: 'New Riders Publishing',
      editorial_id: 6,
      original_title: nil,
      translation: nil,
      edition: 2,
      edition_date: (init_time = Date.parse('2006-06-01')),
      edition_place: 'United States of America',
      publication_year: 2006,
      isbn: '0-321-34475-8',
      created_at: rtime(now,init_time)
    },
    {
      title: 'La sombra de Ender3',
      #author: 'Orson Scott Card',
      author_ids: 8,
      #editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: "Ender's Shadow",
      translation: 'Rafael Marín',
      edition: 1,
      edition_date: (init_time = Date.parse('2012-01-01')),
      edition_place: 'Barcelona',
      publication_year: 1999,
      isbn: '978-84-9872-591-9',
      created_at: rtime(now,init_time)
    
    },
    {
      title: 'La sombra del Hegemón3',
      #author: 'Orson Scott Card',
      author_ids: 8,
     # editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: 'Hegemon\'s Shadow',
      translation: 'Rafael Marín',
      edition: 1,
      edition_date: (init_time = Date.parse('2014-02-01')),
      edition_place: 'Barcelona',
      publication_year: 2001,
      isbn: '978-84-9872-909-2',
      created_at: rtime(now,init_time)
    },
    {
      title: 'La quinta ola 3',
      #author: 'Rick Yancey',
      author_ids: 2,
      #editorial: 'RBA',
      editorial_id:2,
      original_title: 'The 5th Wave',
      translation: 'Pilar Ramírez Tello',
      edition: 1,
      edition_date: (init_time = Date.parse('2013-09-01')),
      edition_place: 'Barcelona',
      publication_year: 2013,
      isbn: '978-84-272-0422-5',
      created_at: rtime(now,init_time)
    },
    {
      title: 'El imperio final 3',
     # author: 'Brandon Sanderson',
      author_ids: 3,
      #editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: 'Mistborn',
      translation: 'Rafael Marín Trechera',
      edition: 2,
      edition_date: (init_time = Date.parse('2011-06-01')),
      edition_place: 'Barcelona',
      publication_year: 2007,
      isbn: '978-84-666-3199-0',
      created_at: rtime(now,init_time)
    },
    {
      title: 'El pozo de la ascensión 3',
      #author: 'Brandon Sanderson',
      author_ids: 3,
      #editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: 'The Well of Ascension: Book Two of Mistborn',
      translation: 'Rafael Marín Trechera',
      edition: 3,
      edition_date: (init_time = Date.parse('2011-06-01')),
      edition_place: 'Barcelona',
      publication_year: 2009,
      isbn: nil,
      created_at: rtime(now,init_time)
    },
    {
      title: 'Web Application Design Patterns 3',
      #author: 'Pawan Vora',
      author_ids: 4,
      #editorial: 'Morgan Kaufmann Publishers',
      editorial_id: 3,
      original_title: nil,
      translation: nil,
      edition: 1,
      edition_date: nil,
      edition_place: 'Canada',
      publication_year: 2009,
      isbn: '978-0-12-374265-0',
      created_at: rtime(now,Date.parse('2009-06-01'))
    },
    {
      title: 'The principles of Beautiful Web Design 3',
      #author: 'Jason Beaird',
      author_ids: 5,
      #editorial: 'SitePoint',
      editorial_id: 4,
      original_title: nil,
      translation: nil,
      edition: 2,
      edition_date: (init_time = Date.parse('2010-11-01')),
      edition_place: 'Canada',
      publication_year: 2010,
      isbn: '978-0-9805768-9-4',
      created_at: rtime(now,init_time)
    },
    {
      title: 'Learning Web Design 3',
      #author: 'Jennifer Niederst Robbins',
      author_ids: 6,
      #editorial: 'O\'Reilly',
      editorial_id: 5,
      original_title: nil,
      translation: nil,
      edition: 3,
      edition_date: (init_time = Date.parse('2007-06-01')),
      edition_place: nil,
      publication_year: 2001,
      isbn: '978-0-596-52752-5',
      created_at: rtime(now,init_time)
    },
    {
      title: 'Don’t Make Me Think 3!',
      #author: 'Steve Krug',
      author_ids: 7,
      #editorial: 'New Riders Publishing',
      editorial_id: 6,
      original_title: nil,
      translation: nil,
      edition: 2,
      edition_date: (init_time = Date.parse('2006-06-01')),
      edition_place: 'United States of America',
      publication_year: 2006,
      isbn: '0-321-34475-8',
      created_at: rtime(now,init_time)
    },
    {
      title: 'La sombra de Ender 4',
      #author: 'Orson Scott Card',
      author_ids: 8,
      #editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: "Ender's Shadow",
      translation: 'Rafael Marín',
      edition: 1,
      edition_date: (init_time = Date.parse('2012-01-01')),
      edition_place: 'Barcelona',
      publication_year: 1999,
      isbn: '978-84-9872-591-9',
      created_at: rtime(now,init_time)
    
    },
    {
      title: 'La sombra del Hegemón 4',
      #author: 'Orson Scott Card',
      author_ids: 8,
     # editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: 'Hegemon\'s Shadow',
      translation: 'Rafael Marín',
      edition: 1,
      edition_date: (init_time = Date.parse('2014-02-01')),
      edition_place: 'Barcelona',
      publication_year: 2001,
      isbn: '978-84-9872-909-2',
      created_at: rtime(now,init_time)
    },
    {
      title: 'La quinta ola 4',
      #author: 'Rick Yancey',
      author_ids: 2,
      #editorial: 'RBA',
      editorial_id:2,
      original_title: 'The 5th Wave',
      translation: 'Pilar Ramírez Tello',
      edition: 1,
      edition_date: (init_time = Date.parse('2013-09-01')),
      edition_place: 'Barcelona',
      publication_year: 2013,
      isbn: '978-84-272-0422-5',
      created_at: rtime(now,init_time)
    },
    {
      title: 'El imperio final 4',
     # author: 'Brandon Sanderson',
      author_ids: 3,
      #editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: 'Mistborn',
      translation: 'Rafael Marín Trechera',
      edition: 2,
      edition_date: (init_time = Date.parse('2011-06-01')),
      edition_place: 'Barcelona',
      publication_year: 2007,
      isbn: '978-84-666-3199-0',
      created_at: rtime(now,init_time)
    },
    {
      title: 'El pozo de la ascensión 4',
      #author: 'Brandon Sanderson',
      author_ids: 3,
      #editorial: 'Ediciones B',
      editorial_id: 1,
      original_title: 'The Well of Ascension: Book Two of Mistborn',
      translation: 'Rafael Marín Trechera',
      edition: 3,
      edition_date: (init_time = Date.parse('2011-06-01')),
      edition_place: 'Barcelona',
      publication_year: 2009,
      isbn: nil,
      created_at: rtime(now,init_time)
    },
    {
      title: 'Web Application Design Patterns 4',
      #author: 'Pawan Vora',
      author_ids: 4,
      #editorial: 'Morgan Kaufmann Publishers',
      editorial_id: 3,
      original_title: nil,
      translation: nil,
      edition: 1,
      edition_date: nil,
      edition_place: 'Canada',
      publication_year: 2009,
      isbn: '978-0-12-374265-0',
      created_at: rtime(now,Date.parse('2009-06-01'))
    },
    {
      title: 'The principles of Beautiful Web Design 4',
      #author: 'Jason Beaird',
      author_ids: 5,
      #editorial: 'SitePoint',
      editorial_id: 4,
      original_title: nil,
      translation: nil,
      edition: 2,
      edition_date: (init_time = Date.parse('2010-11-01')),
      edition_place: 'Canada',
      publication_year: 2010,
      isbn: '978-0-9805768-9-4',
      created_at: rtime(now,init_time)
    },
    {
      title: 'Learning Web Design 4',
      #author: 'Jennifer Niederst Robbins',
      author_ids: 6,
      #editorial: 'O\'Reilly',
      editorial_id: 5,
      original_title: nil,
      translation: nil,
      edition: 3,
      edition_date: (init_time = Date.parse('2007-06-01')),
      edition_place: nil,
      publication_year: 2001,
      isbn: '978-0-596-52752-5',
      created_at: rtime(now,init_time)
    },
    {
      title: 'Don’t Make Me Think 4!',
      #author: 'Steve Krug',
      author_ids: 7,
      #editorial: 'New Riders Publishing',
      editorial_id: 6,
      original_title: nil,
      translation: nil,
      edition: 2,
      edition_date: (init_time = Date.parse('2006-06-01')),
      edition_place: 'United States of America',
      publication_year: 2006,
      isbn: '0-321-34475-8',
      created_at: rtime(now,init_time)
    }
  ])


end
end