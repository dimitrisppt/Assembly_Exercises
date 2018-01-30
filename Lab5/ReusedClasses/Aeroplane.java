package ReusedClasses;


public class Aeroplane {

	private String name;
	private Coordinates coordinates;
	private int speed;
	private int totalDistance;
	private int repairDistance;
	
	public Aeroplane(String name, Coordinates coordinates, int speed, int totalDistance, int repairDistance) {
		
		this.name = name;
		this.coordinates = coordinates;
		this.speed = speed;
		this.totalDistance = totalDistance;
		this.repairDistance = repairDistance;
		
	}

	public int singleFlight(Destination destination) {
		
		int distanceAtStart = totalDistance;
		
		// Hours passing
		while ( coordinates.getX() != destination.getCoordinates().getX() || coordinates.getY() != destination.getCoordinates().getY() ) {
		
			// Right
			if ( coordinates.getX() < destination.getCoordinates().getX()) {
				
				// Can't move at full speed
				if ( destination.getCoordinates().getX() - coordinates.getX() < speed ) {
					
					totalDistance += destination.getCoordinates().getX() - coordinates.getX();
					coordinates.setX(coordinates.getX() + (destination.getCoordinates().getX() - coordinates.getX()));
					
				// Can move at full speed
				} else {
				
					coordinates.setX(coordinates.getX() + speed);
					totalDistance += speed;
				
				}
			
			// Left
			} else if ( coordinates.getX() > destination.getCoordinates().getX()) {
				
				if ( coordinates.getX() - destination.getCoordinates().getX() < speed ) {
					
					totalDistance += (coordinates.getX() - destination.getCoordinates().getX());
					coordinates.setX(coordinates.getX() - (coordinates.getX() - destination.getCoordinates().getX()));
					
				} else {
					
					coordinates.setX(coordinates.getX() - speed);
					totalDistance += speed;
					
				}
				
			}
			
			// Up
			if ( coordinates.getY() < destination.getCoordinates().getY() ) {
				
				if ( destination.getCoordinates().getY() - coordinates.getY() < speed ) {
					
					totalDistance += (destination.getCoordinates().getY() - coordinates.getY());
					coordinates.setY(coordinates.getY() + (destination.getCoordinates().getY() - coordinates.getY()));
					
				} else {
				
					coordinates.setY(coordinates.getY() + speed);
					totalDistance += speed;
				
				}
			
			// Down
			} else if ( coordinates.getY() > destination.getCoordinates().getY() ) {
				
				if ( coordinates.getY() - destination.getCoordinates().getY() < speed ) {
					
					totalDistance += (coordinates.getY() - destination.getCoordinates().getY());
					coordinates.setY(coordinates.getY() - (coordinates.getY() - destination.getCoordinates().getY()));
					
				} else {
				
					coordinates.setY(coordinates.getY() - speed);
					totalDistance += speed;
				
				}
				
			}
			
		}
		
		return totalDistance - distanceAtStart;
		
	}
	
	
	public String getName() {
		
		return name;
		
	}
	
	public Coordinates getCoordinates() {
		
		return coordinates;
		
	}
	
	public int getSpeed() {
		
		return speed;
		
	}
	
	public int getTotalDistance() {
		
		return totalDistance;
		
	}
	
	public int getRepairDistance() {
		
		return repairDistance;
		
	}
	
	public void setName(String name) {
		
		this.name = name;
		
	}
	
	public void setCoordinates(Coordinates coordinates) {
		
		this.coordinates = coordinates;
		
	}
	
	public void setCoordinates(int x, int y) {
		
		this.coordinates = new Coordinates(x , y);
		
	}
	
	public void setSpeed(int speed) {
		
		this.speed = speed;
		
	}
	
	public void setTotalDistance(int totalDistance) {
		
		this.totalDistance = totalDistance;
		
	}
	
	public void setRepairDistance(int repairDistance) {
		
		this.repairDistance = repairDistance;
		
	}
}
