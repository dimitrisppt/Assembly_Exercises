package ReusedClasses;

import java.util.ArrayList;
import java.util.Arrays;

public class FlightSimulation {

	public static void main(String[] args) {
		
		Coordinates destination1Coordinates = new Coordinates(110, 135);
		Destination destination1 = new Destination("Buenos Aires", destination1Coordinates);
		
		Coordinates destination2Coordinates = new Coordinates(5, 30);
		Destination destination2 = new Destination("Muscat", destination2Coordinates);
		
		Coordinates destination3Coordinates = new Coordinates(105, 25);
		Destination destination3 = new Destination("Zanzibar", destination3Coordinates);
		
		Coordinates aeroplaneCoordinates = new Coordinates(110, 135);
		Aeroplane plane = new Aeroplane("Spirit", aeroplaneCoordinates, 12, 0, 2550);
		
		int numberOfRepairs = 0;
		
		for ( int day = 1; day <= 120; day++ ) {
	
			System.out.println("Current day: " + day + " Total distance travelled " + plane.getTotalDistance());
			
			if ( plane.getTotalDistance() < plane.getRepairDistance() ) {
			
				makeFlight(plane, destination1, destination2);
				makeFlight(plane, destination2, destination3);
				makeFlight(plane, destination3, destination2);
				makeFlight(plane, destination2, destination1);
			
			} else {
				
				System.out.println("Going for repairs");
				day += 6;
				plane.setTotalDistance(0);
				numberOfRepairs++;
				
			}
			
		}
		
		System.out.println("Times plane repaired: " + numberOfRepairs);
		
	}
	
	public static void makeFlight(Aeroplane plane, Destination from, Destination to) {
		
		System.out.println(plane.getName() + " travelling from " + from.getName() + " to " + to.getName());
		System.out.println("Travel distance: " + plane.singleFlight(to) + " Total distance: " + plane.getTotalDistance());
		System.out.println(plane.getName() + " is now at " + plane.getCoordinates().getX() + " " + plane.getCoordinates().getY());
		
	}

}
