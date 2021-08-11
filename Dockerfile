FROM bitwalker/alpine-elixir-phoenix:latest as build

WORKDIR /app

COPY mix.exs .
COPY mix.lock .

RUN export MIX_ENV=prod && \
    mix deps.get && \
    mix compile

COPY lib ./lib

RUN export MIX_ENV=prod && \
    mix release

FROM bitwalker/alpine-elixir-phoenix:latest

WORKDIR /app

COPY --from=build /app/_build/prod/rel/jargon_api .
RUN chown -R default: /app

USER default

CMD ["/app/bin/jargon_api", "start"]
