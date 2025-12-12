num = 0
function postear(){
    num++;
    let art1 = document.getElementById("a1")
    let post = document.createElement("article");
    post.className = "post";
    post.id = "postnew" + num;
    art1.appendChild(post);
}