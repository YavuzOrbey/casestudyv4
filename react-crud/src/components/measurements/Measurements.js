import React, { Component } from "react";
import MeasurementDataService from "../../services/measurement.service";
import { Link } from "react-router-dom";

export default class Measurements extends Component {
  constructor(props) {
    super(props);
    this.onChangeSearchTitle = this.onChangeSearchTitle.bind(this);
    this.retrieveMeasurements = this.retrieveMeasurements.bind(this);
    this.refreshList = this.refreshList.bind(this);
    this.setActiveMeasurement= this.setActiveMeasurement.bind(this);

    this.state = {
      Measurements: [],
      currentMeasurement: null,
      currentIndex: -1,
      searchTitle: ""
    };
  }

  componentDidMount() {
    this.retrieveMeasurements();
  }

  onChangeSearchTitle(e) {
    const searchTitle = e.target.value;

    this.setState({
      searchTitle: searchTitle
    });
  }

  retrieveMeasurements() {
    MeasurementDataService.getAll()
      .then(response => {
        this.setState({
          Measurements: response.data
        });
        console.log(response.data);
      })
      .catch(e => {
        console.log(e);
      });
  }

  refreshList() {
    this.retrieveMeasurements();
    this.setState({
      currentMeasurement: null,
      currentIndex: -1
    });
    }

    setActiveMeasurement(Measurement, index) {
       this.setState({
         currentMeasurement: Measurement,
         currentIndex: index
       });
     }
    render(){
        const { searchTitle, Measurements, currentMeasurement, currentIndex } = this.state;

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
              <h4>Measurements List</h4>

              <ul className="list-group">
                {Measurements &&
                  Measurements.map((Measurement, index) => (
                    <li
                      className={
                        "list-group-item " +
                        (index === currentIndex ? "active" : "")
                      }
                      onClick={() => this.setActiveMeasurement(Measurement, index)}
                      key={index}
                    >
                      {Measurement.name}
                    </li>
                  ))}
              </ul>

              <button
                className="m-3 btn btn-sm btn-danger"
                onClick={this.removeAllMeasurements}
              >
                Remove All
              </button>
            </div>
            <div className="col-md-6">
              {currentMeasurement ? (
                <div>
                  <h4>Measurement</h4>
                  <div>
                    <label>
                      <strong>Id:</strong>
                    </label>{" "}
                    {currentMeasurement.id}
                  </div>
                  <div>
                    <label>
                      <strong>Name:</strong>
                    </label>{" "}
                    {currentMeasurement.name}
                  </div>
                  <Link
                    to={"/Measurement/" + currentMeasurement.id}
                    className="badge badge-warning"
                  >
                    View
                  </Link>
                </div>
              ) : (
                <div>
                  <br />
                  <p>Please click on a Measurement...</p>
                </div>
              )}
            </div>
          </div>
        );
      }
  }





/*
import React, {useEffect} from "react";
import { Link, Route, useRouteMatch } from "react-router-dom";
import Measurement from "./Measurement";
import MeasurementDataService from "../../services/measurement.service";
const Measurements = ({ match }) => {

    useEffect(() => {
        MeasurementDataService.getAll()
              .then(response => {
                this.measurementData = response.data;
                console.log(response.data)
                })
              .catch(e => {
                console.log(e);
              })
              })
  let measurementData;

  */
/*MeasurementDataService.getAll().then(response => {
                                console.log(response.data)

                                  return response.data})
                                .catch(e => {
                                  console.log(e);
                                });*//*

  const { url } = useRouteMatch();
  */
/* Create an array of `<li>` items for each product *//*

  const linkList = measurementData.map((measurement) => {
    return (
      <li key={measurement.id}>
        <Link to={`${url}/${measurement.id}`}>{measurement.name}</Link>
      </li>
    );
  });

  return (
    <div>
      <div>
        <div>
          <h3>Measurements</h3>
          <ul>{linkList}</ul>
        </div>
      </div>

      <Route path={`${url}/:measurementId`}>
        <Measurement data={measurementData} />
      </Route>
      <Route exact path={url}>
        <p>Please select a measurement</p>
      </Route>
    </div>
  );
};

export default Measurements;*/
