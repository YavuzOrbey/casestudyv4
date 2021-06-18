import React, { Component } from "react";
import { Link } from "react-router-dom";
import './landing.css'
export default class Landing extends Component{
       constructor(props){
       super(props)
       }

       render(){
       return (

        <div className='container'>

            <div id='video-container' className="mb-4 shadow-sm position-relative" >
                <h1 className="fw-bold border border-dark border-2 w-50  p-5 text-center">Suspendisse</h1>
                <video playsInline autoPlay muted loop poster={process.env.REACT_APP_CONTEXT_PATH + "/images/header-image.jpg"} id="theVideo">
                    <source src={process.env.REACT_APP_CONTEXT_PATH + "/images/video.mp4"} type="video/mp4" />
                </video>
           </div>
           <div className='main-content'>
                <div className='section-1 row justify-content-around p-5'>
                    <div className='col-12 col-md-4'>
                        <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempus eu ipsum vel sodales. Cras vehicula posuere libero vel vehicula. Vestibulum rutrum eget sapien a sodales. Sed a neque mattis, rutrum lorem eget, ornare justo.
                        </p>
                    </div>
                    <div className='col-12 col-md-4'>
                        <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempus eu ipsum vel sodales. Cras vehicula posuere libero vel vehicula. Vestibulum rutrum eget sapien a sodales. Sed a neque mattis, rutrum lorem eget, ornare justo.
                        </p>
                    </div>
                </div>
                <hr className='hr-thick' />
                <div className='section-2 row justify-content-around p-5'>
                  <div className="col-12 col-md-4">
                    <div className="card ">
                      <img src={process.env.REACT_APP_CONTEXT_PATH + "/images/pexels-brigitte-tohm-239581.jpg"} className="card-img-top d-block" alt="macarons" />
                      <div className="card-body">
                        <h5 className="card-title text-center">Create New Recipes</h5>
                        <p className="card-text">Suspendisse laoreet lacus eu urna blandit condimentum. Morbi facilisis consectetur.</p>
                      </div>
                    </div>
                  </div>
                  <div className="col-12 col-md-4">
                    <div className="card ">
                      <img src={process.env.REACT_APP_CONTEXT_PATH+ "/images/pexels-ella-olsson-3026805.jpg"} className="card-img-top d-block" alt="chicken satay" />
                      <div className="card-body">
                        <h5 className="card-title text-center">Meal Planning</h5>
                        <p className="card-text">Suspendisse laoreet lacus eu urna blandit condimentum. Morbi facilisis consectetur.</p>
                      </div>
                    </div>
                  </div>
                  <div className="col-12 col-md-4">
                    <div className="card ">
                      <img src={process.env.REACT_APP_CONTEXT_PATH + "/images/pexels-dzenina-lukac-1583884.jpg"} class="card-img-top d-block" alt="french fries" />

                      <div className="card-body">
                        <h5 className="card-title text-center">Food Inventory Management</h5>
                        <p className="card-text">Suspendisse laoreet lacus eu urna blandit condimentum. Morbi facilisis consectetur.</p>
                      </div>
                    </div>
                  </div>
                </div>
                <hr className='hr-thick' />
                <div className='section-3 row justify-content-around p-5'>
                  <div className='col-12 col-md-4'>
                    <p>
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac odio id ipsum malesuada sagittis. Nam a elit molestie, dapibus urna ac, faucibus est. Etiam pharetra mattis ipsum sit amet consectetur.
                    </p>
                  </div>
                  <div className='col-12 col-md-4'>
                    <p>
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempus eu ipsum vel sodales. Cras vehicula posuere libero vel vehicula. Vestibulum rutrum eget sapien a sodales. Sed a neque mattis, rutrum lorem eget, ornare justo.
                    </p>
                  </div>
                </div>
           </div>
        </div>);
       }
}