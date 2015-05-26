#!/usr/bin/ruby

require 'cgi'
require 'sqlite3'

cgi = CGI.new("html4")

cgi.out{
	cgi.html{
		cgi.head{ "\n"+cgi.title{"This Is a Test"} } +
		cgi.body{ "\n"+
						cgi.form("METHOD"=>"post","ACTION"=>"/cgi-bin/ruby/go.rb"){"\n"+
																										 cgi.hr +
																										 cgi.h1 { "A Form: " } + "\n"+
																										 cgi.textarea("get_text") +"\n"+
																										 cgi.br +
																										 cgi.submit
	}
	}
	}
}



begin

	db = SQLite3::Database.open "v1link.db"
	#	db.execute "CREATE TABLE IF NOT EXISTS Cars(Id INTEGER PRIMARY KEY, Name TEXT, Price INT)"
	#	db.execute "INSERT INTO Cars VALUES(1,'Audi',52642)"
	#	db.execute "INSERT INTO Cars VALUES(2,'Mercedes',57127)"
	#	db.execute "INSERT INTO Cars VALUES(3,'Skoda',9000)"
	#	db.execute "INSERT INTO Cars VALUES(4,'Volvo',29000)"
	#	db.execute "INSERT INTO Cars VALUES(5,'Bentley',350000)"
	#	db.execute "INSERT INTO Cars VALUES(6,'Citroen',21000)"
	#	db.execute "INSERT INTO Cars VALUES(7,'Hummer',41400)"
	#	db.execute "INSERT INTO Cars VALUES(8,'Volkswagen',21600)"

	rs = db.execute "select * from v1link"

	rs.each do |row|
		puts row.join "\s"
		puts "<br>"
	end

rescue SQLite3::Exception => e 

	puts "Exception occurred"
	puts e

ensure
	db.close if db
end
