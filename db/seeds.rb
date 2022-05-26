# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.fi

Word.create([{korean_word: '가방', romanja: 'gabang', translation:'bag'}, 
            {korean_word: '의자', romanja: 'uija', translation: 'chair'},
		    {korean_word: '과일', romanja: 'gwail', translation: 'fruit'}] 
)

Number.create([{korean_word: '하나', romanja: 'hana', translation:'one', variant:'Korean'},
               {korean_word: '둘', romanja: 'dul', translation:'two', variant:'Korean'},
               {korean_word: '셋', romanja: 'set', translation:'three', variant:'Korean'},
               {korean_word: '일', romanja: 'il', translation:'one', variant:'Sino-Korean'},
               {korean_word: '이', romanja: 'i', translation:'two', variant:'Sino-Korean'},
               {korean_word: '삼', romanja: 'sam', translation:'three', variant:'Sino-Korean'}, ])