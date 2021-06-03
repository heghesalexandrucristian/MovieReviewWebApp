const API_KEY = "api_key=4090808be0851c16cf6ddc71533a5308";
const base_url = "https://api.themoviedb.org/3";
const api_url = base_url + "/discover/movie?sort_by=popularity.desc&" + API_KEY;
const img_url = "https://image.tmdb.org/t/p/w500";
const trailer_url = "https://api.themoviedb.org/3/movie/";
const searchURL = base_url + '/search/movie?' + API_KEY;

const main = document.getElementById('main');
const body = document.getElementById('body');
const form = document.getElementById('form');
const search = document.getElementById('search');

function testvariabila() {
    let variabilatest = 0;
    variabilatest += 1;
    return variabilatest;
}
getMovies(api_url);

function getMovies(url) {
    fetch(url).then(res => res.json()).then(data => {
        console.log(data.results);
        //sortare dupa scor??
        data.results.sort(function (a, b) {
            console.log(b.vote_average - a.vote_average);
            return (b.vote_average - a.vote_average);
        });
        showMovies(data.results);
    })
}

//    const background=document.createElement("div");
//background.classList="background";
//main.appendChild(background);

function showMovies(data) {

    main.innerHTML = '';

    data.forEach(movie => {
        const {
            title,
            poster_path,
            vote_average,
            overview,
            id
        } = movie;
        const movieEl = document.createElement('div');

        //quick fix pentru lipsa imagine?
        if (poster_path == null) {
            return;
        }

        movieEl.classList.add('movie');

        movieEl.addEventListener("click", function () {
            /*pentru pagina 2*/
            functietest(title, poster_path, vote_average, overview, id);
        });
        movieEl.innerHTML = `
        <img src="${img_url+poster_path}" alt="${title}" >
        <div class="movie-info">
             <h3>${title}</h3>
            <span class="${getColor(vote_average)}">${vote_average}</span>
            <!------------???---------->
        </div>
        <div class="overview">
            <h3>Overview</h3>
            ${overview}
            

        </div>
        

    `

        main.appendChild(movieEl);

    })
}

function getColor(vote) {
    if (vote >= 8) {
        return "green"
    } else if (vote >= 5) {
        return "orange"
    } else {
        return "red"
    }
}


//HELP ME GOD

function functietest(_title, _poster_path, _vote_average, _overview, _id) {
    main.innerHTML = '';
    main.style.minHeight = "100vh";
    main.style.display = "flex";
    main.style.alignItems = "start";
    /*body.style.backgroundColor="white";*/



    const container = document.createElement('div');
    container.classList.add('testare');
    container.innerHTML = "";


    const movieEl = document.createElement('div');
    movieEl.classList.add('movie2');

    const trailer = document.createElement("div");
    trailer.classList.add('trailer');

    test = trailer_url + _id + '/videos?' + API_KEY;

    fetch(test).then(res => res.json()).then(data => {
        console.log(data.results);
        trailerkey(data.results);
    })

    function trailerkey(data) {
        data.forEach(data => { /// ???????????? cum se ia altfel
            const {
                key
            } = data;


            trailer.innerHTML = `

            <iframe width="500px" src="https://www.youtube.com/embed/${key}"></iframe>
            

    `
        })

        /* <h3>${_title}</h3>
            <span class="${getColor(_vote_average)}">${_vote_average}</span>*/


    }


    const movieEl2 = document.createElement('div');
    movieEl2.classList.add('text');


    const movieEl3 = document.createElement('div');
    movieEl3.classList.add('rating');

    movieEl.innerHTML = `
        <img src="${img_url+_poster_path}" alt="${_title}" >
            <!------------???---------->
    `

    movieEl2.innerHTML = `
            <h2>Overview:</h2>
            ${_overview}

    `
    //incercare rating

    const ratingsistele = document.createElement("div");
    ratingsistele.classList.add("ratingsistele");

    const movieRating = document.createElement("div");
    movieRating.classList.add("ratings");


    const star = document.createElement("span");
    star.classList.add("far");
    star.classList.add("fa-star");
    const star2 = document.createElement("span");
    star2.classList.add("far");
    star2.classList.add("fa-star");
    const star3 = document.createElement("span");
    star3.classList.add("far");
    star3.classList.add("fa-star");
    const star4 = document.createElement("span");
    star4.classList.add("far");
    star4.classList.add("fa-star");
    const star5 = document.createElement("span");
    star5.classList.add("far");
    star5.classList.add("fa-star");
    var stele = [star, star2, star3, star4, star5];


    //rating average de pe server propriu


    $.ajax({
        method: "POST",
        url: "getaverage.php",
        data: {
            value: _id
        },
        success: function (result) {
            //alert("Hi, testing");
            //alert( result );
            // console.log(result);
            averager(result);
        }
    });

    const ratingwindow = document.createElement("div");
    ratingwindow.classList.add("ratingwindow");



    function averager(average) {
        var average_rating = average;
        averagecolor(average);
        ratingwindow.innerHTML = `
        ${average_rating}
    `
    }

    function averagecolor(average) {
        if (average < 3 && average >0) {
            ratingwindow.style.color = "red";
        }
        if (average >= 3 && average <= 4) {
            ratingwindow.style.color = "yellow";
        }
        if (average > 4 && average <= 5) {
            ratingwindow.style.color = "lawngreen";
        }



    }

    //star creation

    star.setAttribute("data-rating", "1")
    //star.innerHTML=`&nbsp`

    movieRating.appendChild(star);
    star2.setAttribute("data-rating", "2");
    movieRating.appendChild(star2);
    star3.setAttribute("data-rating", "3");
    movieRating.appendChild(star3);
    star4.setAttribute("data-rating", "4");
    movieRating.appendChild(star4);
    star5.setAttribute("data-rating", "5");
    movieRating.appendChild(star5);



    stele.forEach(function (element) {
        console.log(element);
        element.addEventListener("click", function () {
            var test2 = 0;
            testestest(element, test2);
        })
    })
    ///for (i=0 ; i<stele.length;i++){
    //        console.log(i);
    //      stele[i].addEventListener("click", function(){

    //       });
    //  }
    $.ajax({
        method: "POST",
        url: "getrating.php",
        data: {
            value: _id
        },
        success: function (result) {
            //alert("Hi, testing");
            // alert( result );
            // console.log(result);
            if (result != 0) {
                stele.forEach(function (element) {
                    console.log(element);
                    testestest(element, result);
                })
                // console.log("amreusit");
            }
        }
    });

    //  $.post("getrating.php",{_id}).done(function(data){
    // What do I do with the data?
    // console.log(data);
    //});



    function testestest(_star, _test2) {
        var i = 0;

        if (_test2 == 0) {
            test = _star.getAttribute("data-rating");
        } else {
            test = _test2;
        }
        console.log("wtf" + test);

        if (_star.classList.contains("far")) {
            for (i = 0; i < test; i++) {
                stele[i].classList.replace("far", "fas");
            }
        } else {
            for (i = 4; i >= test; i--) {
                stele[i].classList.replace("fas", "far");
            }
            i = i + 1;
        }

        if (_test2 == 0) {
            $.ajax({
                method: "POST",
                url: "rating.php",
                data: {
                    value: i,
                    testid: _id
                },
                success: function (result) {
                    //alert("Hi, testing");
                   // alert(result);
                }
            });
        }
    }

    movieEl3.innerHTML = `
    <h2>Rating:</h2>

`
    ratingsistele.appendChild(ratingwindow);
    //const input = document.createElement("input");
    //  input.type="hidden";
    //  input.name="numeinput";
    //   input.classList.add("rating-value");
    //  input.value="1";


    const plsrate = document.createElement("h3");
    plsrate.classList.add("h2rate");
    plsrate.innerHTML = `
        Rate this movie:
     `

    ratingsistele.appendChild(plsrate);
    ratingsistele.appendChild(movieRating);
    movieEl3.appendChild(ratingsistele);
    // movieRating.appendChild(input);


    /// //     ADAUGARE COMENTARII     /////////////////////                      ////////
    
    const urlcomentarii=base_url+"/movie/"+_id+"/reviews?"+API_KEY+"&language=en-US&page=1";
    getcoments(urlcomentarii);
    function getcoments(urlcomentarii) {
        fetch(urlcomentarii).then(res => res.json()).then(data => {
            console.log(data.results);
        
            showcomments(data.results);

        })
    }

  //  const reviewtitle=document.createElement("div");
       // reviewtitle.classList.add("divcomments");

       // reviewtitle.innerHTML=`
        //<h2>Reviews</h2>
      //  `
        //container.appendChild(reviewtitle);

    function showcomments(data)
    {
        data.forEach(element =>{
            const{
                author,
                content,
                id,
                updated_at,
            }=element

        const divcoments=document.createElement("div");
        divcoments.classList.add("divcomments");

        divcoments.innerHTML=`
        <h4>${author}</h4>
        <p>${content}<p>
        `
        const time=document.createElement("div");
        time.classList.add("time");

            time.innerHTML=`
            <p>${updated_at.split('T',1)}</p>
            `
            divcoments.appendChild(time);
        container.appendChild(divcoments);
        });

    
    }
    


    main.appendChild(container);
    container.appendChild(movieEl);
    container.appendChild(movieEl2);
    container.appendChild(movieEl3);
    container.appendChild(trailer);
    topFunction();
    variabilatest = testvariabila();
    const test99 = main.innerHTML;
    JSON.stringify(test99);
    history.pushState({
        page: variabilatest
    }, "title 2", "?page=2")


}


function topFunction() {
    document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}


form.addEventListener("submit", (e) => {
    e.preventDefault();
    const searchTerm = search.value;

    if (searchTerm) {
        getMovies(searchURL + '&query=' + searchTerm);
        variabilatest = testvariabila();
        history.pushState({
            page: variabilatest
        }, "title 3", "?page=3");
    } else {
        getMovies(api_url);
    }
})




//back 
var variabilatest = testvariabila();
window.history.pushState({
    page: variabilatest
}, "title 1", "?page=1")
window.onpopstate = function (event) {
    //alert(`location: ${document.location}, state: ${JSON.stringify(event.state)}`);
    history.go(event);

    // history.go(`location: ${document.location}, state: ${JSON.stringify(event.state)}`);
}

function backcandsuntlogat() {
    //alert(`location: ${document.location}, state: ${JSON.stringify(event.state)}`);
    history.go(-1);

    // history.go(`location: ${document.location}, state: ${JSON.stringify(event.state)}`);

}


function logare() {
    main.innerHTML = "";
    main.style.height = '100vh';

    const container = document.createElement('div');
    const label1 = document.createElement("label");
    const label2 = document.createElement("label");
    const info1 = document.createElement("i");
    const info2 = document.createElement("i");
    const input1 = document.createElement("input");
    const input2 = document.createElement("input");
    const input3 = document.createElement("input");
    const input4 = document.createElement("input");

    input1.type = "text";
    input1.name = "username";
    input1.placeholder = "Username";
    input1.id = "username";
    input1.required = "true";


    input2.type = "password";
    input2.name = "password";
    input2.placeholder = "Password";
    input2.id = "password";
    input2.required = "true";

    input3.type = "submit";
    input3.value = "Login";


    input4.type = "button";
    input4.value = "Register";
    input4.addEventListener("click", function () {
        window.open('registration.php');
        // window.open('registration.php',"_self");
    })


    info1.classList.add("fas", "fa-user");
    info2.classList.add("fas", "fa-lock")

    label1.htmlFor = "username";
    label2.htmlFor = "password";

    container.classList.add('formlogare');
    const formular = document.createElement("form");
    formular.action = "autentificare.php";
    formular.method = "post";


    const titlu = document.createElement("h1");

    titlu.append("Login")




    container.append(titlu);
    label1.append(info1);
    label2.append(info2);
    formular.append(label1);
    formular.append(input1);
    formular.append(label2);
    formular.append(input2);
    formular.append(input4);
    formular.append(input3);
    container.append(formular);

    main.append(container);


    var meta = document.createElement('meta');
    meta.name = 'viewport';
    meta.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0');
    document.getElementsByTagName('head')[0].appendChild(meta);
}