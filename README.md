# SafePlace

SafePlace to aplikacja, która pomaga uczniom wykształcić umiejętność rozpoznawania zagrożeń w sieci.

# Wymagania

* Ruby 2.5
* PostgreSQL

# Instalacja

Aplikacja korzysta z subdomen - w pliku `.env.example` zostały skonfigurowane subdomeny w domenie `lvh.me` która wskazuje na `127.0.0.1`, w przeciwnym wypadku należy zmodyfikować plik `/etc/hosts`.

Do uruchomienia symulacji strony kina wymagany jest klucz API [The Movie Database](https://www.themoviedb.org/documentation/api).

```bash
git clone git@github.com:edukaton/surge.git && cd surge
bundle install
cp .env.example .env
# Wypełnij TMDB_API_KEY prawdziwym kluczem API The Movie Database
bin/rake db:create
bin/rake db:migrate
bin/rake import
bin/rails server
```
