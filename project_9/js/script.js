/* Задания на урок:

1) Удалить все рекламные блоки со страницы (правая часть сайта)

2) Изменить жанр фильма, поменять "комедия" на "драма"

3) Изменить задний фон постера с фильмом на изображение "bg.jpg". Оно лежит в папке img.
Реализовать только при помощи JS

4) Список фильмов на странице сформировать на основании данных из этого JS файла.
Отсортировать их по алфавиту 

5) Добавить нумерацию выведенных фильмов */


/* Задания на урок:

1) Реализовать функционал, что после заполнения формы и нажатия кнопки "Подтвердить" - 
новый фильм добавляется в список. Страница не должна перезагружаться.
Новый фильм должен добавляться в movieDB.movies.
Для получения доступа к значению input - обращаемся к нему как input.value;
P.S. Здесь есть несколько вариантов решения задачи, принимается любой, но рабочий.

2) Если название фильма больше, чем 21 символ - обрезать его и добавить три точки

3) При клике на мусорную корзину - элемент будет удаляться из списка (сложно)

4) Если в форме стоит галочка "Сделать любимым" - в консоль вывести сообщение: 
"Добавляем любимый фильм"

5) Фильмы должны быть отсортированы по алфавиту */

'use strict';

document.addEventListener('DOMContentLoaded', () => {
    const movieDB = {
        movies: [
            "Логан",
            "Лига справедливости",
            "Ла-ла лэнд",
            "Одержимость",
            "Скотт Пилигрим против..."
        ]
    };
    
    
    const adv = document.querySelectorAll('.promo__adv img'),
          movieList = document.querySelector('.promo__interactive-list'),
          ganre = document.querySelector('.promo__genre'),
          bgimg = document.querySelector('.promo__bg'),
          addForm = document.querySelector('form.add'),
          input = addForm.querySelector('.adding__input'),
          checkbox = addForm.querySelector('[type="checkbox"]');

         


          
    
    
    const deleleteAdv = (arr) => {
        arr.forEach((element) => {
            element.remove();
        });
    };

    const makeChanges = () => {
        ganre.innerHTML = "Драма";
    
        bgimg.style.backgroundImage = "url('img/bg.jpg')";
    };
    
    const sortArr = (arr) => {
        arr.sort();
    };
    
    addForm.addEventListener('submit', (e)=>{
        e.preventDefault();
        
        let newFilm = input.value;
        const favorite = checkbox.checked;


        if (newFilm) {

            if(newFilm.length > 21) {
                newFilm = `${newFilm.slice(0,21)}...`;
            }

            if (favorite) {
                console.log("favorit film");
            }

            movieDB.movies.push(newFilm);
            sortArr(movieDB.movies);
    
            creatMovieList(movieDB.movies, movieList);
        }
        
        

        addForm.target.reset();
                
    });

    

function creatMovieList (films, parent) {
    
    sortArr(movieDB.movies);
    
    parent.innerHTML = "";
   
     films.forEach((item, n)=>{
        parent.innerHTML +=`<li class="promo__interactive-item">${n + 1 +". "}${item}
        <div class="delete"></div>
    </li>`;
    });
    
    const delFilm = document.querySelectorAll('.delete');
   
    delFilm.forEach((btn, i) => {
        btn.addEventListener('click', () => {
            btn.parentElement.remove();
            movieDB.movies.splice(i, 1);
            creatMovieList(films, parent);
        });
    });

}


creatMovieList(movieDB.movies, movieList);

deleleteAdv(adv);

makeChanges();



});

