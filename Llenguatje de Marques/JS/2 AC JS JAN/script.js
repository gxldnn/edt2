num = 0;

let staticposts = document.getElementsByClassName("post")

for (let post of staticposts) {
  let button = document.createElement("button")
  button.className = "borrar";
  button.onclick = function() {
    post.remove();
  };
  button.textContent = "🗑️";
  post.appendChild(button)
}

function postear(event){
  let parent = event.target.parentElement;
  num++;

  let art = document.getElementById(parent.id).firstElementChild;

  let post = document.createElement("article");
  let divimg = document.createElement("div");
  let divbox = document.createElement("div");
  let deletebutton = document.createElement("button");
  
  divimg.className = "imagentexto";
  divbox.className = "box";
  deletebutton.className = "borrar";

  let content = parent.querySelector("#contenttext"); 
  let name = parent.querySelector("#name");           

  post.id = "postnew" + num;
  post.className = "post";
  divimg.id = "img" + num;
  divbox.id = "box" + num;

  art.appendChild(post);
  post.appendChild(divimg);
  post.appendChild(divbox);
  post.appendChild(deletebutton)

  let avatar = divimg.appendChild(document.createElement("img"));
  let post_nickname = divimg.appendChild(document.createElement("p"));

  avatar.src = "img/avatar.jpg";
  post_nickname.textContent = name.value;

  let postcontent = divbox.appendChild(document.createElement("p"));
  postcontent.textContent = content.value;

  deletebutton.textContent = "🗑️";

  deletebutton.onclick = function(del) {
    let parentdel = del.target.parentElement;
    document.getElementById(parentdel.id).remove();
  };
};
