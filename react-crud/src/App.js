import React, { Component } from "react";
import { Switch, Route, Link } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import "./App.css";
import Nutrients from "./components/nutrients/nutrients-list.component";
import Landing from "./components/pages/landing.component";
import Measurements from "./components/measurements/Measurements";
import Ingredients from "./components/ingredients/Ingredients";
class App extends Component {

  render() {
    return (
<div>
  <nav className='navbar navbar-expand-lg bg-dark d-flex justify-content-end'>
    <div className='d-flex flex-row justify-content-evenly'>
      <form className="d-flex h-100">
        <input className="form-control me-2 h-auto" id='search' type="search" pattern="[a-z]{5,10}" placeholder="Search" aria-label="Search"></input>
        <button className="btn" id='search-button' type="submit"><i className="fas fa-search text-white"></i></button>
      </form>
      <ul className='navbar-nav me-auto mb-2 mb-lg-0 bg-transparent '>
        <li className="nav-item"><a className="nav-link link-light fs-5" href="/home">Home</a></li>
        <li className="nav-item"><a className="nav-link link-light fs-5" href="/login">Login</a></li>
        <li className="nav-item"><a className="nav-link link-light fs-5" href="/register">Register</a></li>
        <li className="nav-item"><a className="nav-link link-light fs-5" href="/dashboard">Dashboard</a></li>
        <Link to={"/add"} className="nav-link">Add</Link>
      </ul>
    </div>
  </nav>
  <div className='d-flex secondary-nav'>
    <div className="dropdown">
      <button className="dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false"
      style={{backgroundColor: "transparent", border: "none"}}>Recipes & Ingredients</button>
      <ul className="dropdown-menu bg-light p-5" aria-labelledby="dropdownMenuButton1">
        <li className='row '>
          <div className='col-md-3'>
            <h6>Recipes</h6>
            <ul className='list-unstyled'>
              <li ><a href="/recipes" className='link-secondary text-decoration-none'>Browse</a></li>
              <li ><a href="${pageContext.request.contextPath}/recipe" className='link-secondary text-decoration-none'>Search</a></li>
            </ul>
          </div>
          <div className='col-md-3'>
            <h6>Ingredients</h6>
            <ul className='col-md-3 list-unstyled'>

              <li ><a href="/ingredients" className='link-secondary text-decoration-none'>Browse</a></li>
              <li ><a href="${pageContext.request.contextPath}/measurement" className='link-secondary text-decoration-none'>Search</a></li>
            </ul>
          </div>

          <div className='col-md-3'>
              <h6>Measurements</h6>
              <ul className='col-md-3 list-unstyled'>

                <li ><a href="/measurements" className='link-secondary text-decoration-none'>Browse</a></li>
                <li ><a href="${pageContext.request.contextPath}/measurement" className='link-secondary text-decoration-none'>Search</a></li>
              </ul>
          </div>

            <div className='col-md-3'>
              <h6>Nutrients</h6>
              <ul className='col-md-3 list-unstyled'>
                 <li ><a href="/nutrients" className='link-secondary text-decoration-none'>Browse</a></li>
                 <li ><a href="${pageContext.request.contextPath}/nutrient" className='link-secondary text-decoration-none'>Search</a></li>
               </ul>
            </div>
          </li>
        </ul>
    </div>
  </div>
  <div className="container mt-3">
      <Switch>
        <Route exact path={["/", "/home"]} component={Landing} />
        <Route exact path={"/nutrients"} component={Nutrients} />
        <Route exact path={"/measurements"}><Measurements /></Route>
       /* <Route exact path={"/ingredients"}><Ingredients /></Route>*/
      </Switch>
  </div>
</div>
    );
  }
}
export default App;