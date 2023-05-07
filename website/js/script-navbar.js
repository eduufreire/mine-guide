const navbar = document.getElementsByTagName('nav')[0]

function changeNavbar(){
    if(scrollY == 0){
        navbar.style = 'background-color = none'
    } else {
        navbar.style.backgroundColor = '#0F0F0F'
    }
}

window.addEventListener('scroll', ()=>{
    changeNavbar()
})