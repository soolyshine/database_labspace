CREATE TABLE stations (
    station_id SERIAL PRIMARY KEY, 
    name VARCHAR(255) NOT NULL,
    line_id INT NOT NULL, 
    position INT, 
    is_active BOOLEAN DEFAULT TRUE, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE lines (
    line_id SERIAL PRIMARY KEY, 
    name VARCHAR(255) NOT NULL,
    color VARCHAR(7), 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE connections (
    connection_id SERIAL PRIMARY KEY, 
    from_station_id INT NOT NULL, 
    to_station_id INT NOT NULL, 
    transition_type VARCHAR(50) NOT NULL, 
    is_active BOOLEAN DEFAULT TRUE, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (from_station_id) REFERENCES stations(station_id),
    FOREIGN KEY (to_station_id) REFERENCES stations(station_id)
);

CREATE TABLE station_history (
    history_id SERIAL PRIMARY KEY, 
    station_id INT NOT NULL, 
    action VARCHAR(255) NOT NULL, 
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (station_id) REFERENCES stations(station_id)
);

CREATE TABLE transitions (
    transition_id SERIAL PRIMARY KEY, 
    station_a_id INT NOT NULL,
    station_b_id INT NOT NULL, 
    station_c_id INT, 
    transition_type VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (station_a_id) REFERENCES stations(station_id),
    FOREIGN KEY (station_b_id) REFERENCES stations(station_id),
    FOREIGN KEY (station_c_id) REFERENCES stations(station_id)
);
