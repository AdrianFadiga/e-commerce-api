# Use the official Ruby image as the parent image
FROM ruby:3.0.2

# Set the working directory to /app
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the image
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install

# Copy the rest of the application code into the image
COPY . .

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]