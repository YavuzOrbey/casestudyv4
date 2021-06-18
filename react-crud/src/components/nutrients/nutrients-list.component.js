import React, { Component } from "react";
import NutrientDataService from "../../services/nutrient.service";
import { Link } from "react-router-dom";

export default class Nutrients extends Component {
  constructor(props) {
    super(props);
    this.onChangeSearchTitle = this.onChangeSearchTitle.bind(this);
    this.retrieveNutrients = this.retrieveNutrients.bind(this);
    this.refreshList = this.refreshList.bind(this);
    this.setActiveNutrient= this.setActiveNutrient.bind(this);

    this.state = {
      nutrients: [],
      currentNutrient: null,
      currentIndex: -1,
      searchTitle: ""
    };
  }

  componentDidMount() {
    this.retrieveNutrients();
  }

  onChangeSearchTitle(e) {
    const searchTitle = e.target.value;

    this.setState({
      searchTitle: searchTitle
    });
  }

  retrieveNutrients() {
    NutrientDataService.getAll()
      .then(response => {
        this.setState({
          nutrients: response.data
        });
        console.log(response.data);
      })
      .catch(e => {
        console.log(e);
      });
  }

  refreshList() {
    this.retrieveNutrients();
    this.setState({
      currentNutrient: null,
      currentIndex: -1
    });
    }

    setActiveNutrient(nutrient, index) {
       this.setState({
         currentNutrient: nutrient,
         currentIndex: index
       });
     }
    render(){
        const { searchTitle, nutrients, currentNutrient, currentIndex } = this.state;

        return (
          <div className="list row">
            <div className="col-md-8">
              <div className="input-group mb-3">
                <input
                  type="text"
                  className="form-control"
                  placeholder="Search by title"
                  value={searchTitle}
                  onChange={this.onChangeSearchTitle}
                />
                <div className="input-group-append">
                  <button
                    className="btn btn-outline-secondary"
                    type="button"
                    onClick={this.searchTitle}
                  >
                    Search
                  </button>
                </div>
              </div>
            </div>
            <div className="col-md-6">
              <h4>Nutrients List</h4>

              <ul className="list-group">
                {nutrients &&
                  nutrients.map((nutrient, index) => (
                    <li
                      className={
                        "list-group-item " +
                        (index === currentIndex ? "active" : "")
                      }
                      onClick={() => this.setActiveNutrient(nutrient, index)}
                      key={index}
                    >
                      {nutrient.name}
                    </li>
                  ))}
              </ul>

              <button
                className="m-3 btn btn-sm btn-danger"
                onClick={this.removeAllNutrients}
              >
                Remove All
              </button>
            </div>
            <div className="col-md-6">
              {currentNutrient ? (
                <div>
                  <h4>Nutrient</h4>
                  <div>
                    <label>
                      <strong>Id:</strong>
                    </label>{" "}
                    {currentNutrient.id}
                  </div>
                  <div>
                    <label>
                      <strong>Name:</strong>
                    </label>{" "}
                    {currentNutrient.name}
                  </div>
                  <Link
                    to={"/nutrient/" + currentNutrient.id}
                    className="badge badge-warning"
                  >
                    View
                  </Link>
                </div>
              ) : (
                <div>
                  <br />
                  <p>Please click on a Nutrient...</p>
                </div>
              )}
            </div>
          </div>
        );
      }
  }