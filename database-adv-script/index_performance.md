# Index Performance Report

## Before Indexing
- Query to fetch bookings by user took 350ms.
- Query to fetch reviews by property took 280ms.

## After Indexing
- Booking query dropped to 80ms.
- Review query dropped to 60ms.

### Observation
Strategic indexing improved read performance by ~75%.