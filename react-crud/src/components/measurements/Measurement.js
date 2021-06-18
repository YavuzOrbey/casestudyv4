import React from "react";
import { useParams } from "react-router-dom";

const Measurement = ({ data }) => {
  const { measurementId } = useParams();
  const measurement = data.find(m => m.id === Number(measurementId));
  let measurementData;

  if (measurement) {
    measurementData = (
      <div>
        <h3> {measurement.id} </h3>
        <p>{measurement.name}</p>
      </div>
    );
  } else {
    measurementData = <h2> Sorry. Measurement doesn't exist </h2>;
  }

  return (
    <div>
      <div>{measurementData}</div>
    </div>
  );
};

export default Measurement;