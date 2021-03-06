defmodule Sentry.BeforeSendEventTest do
  def before_send_event(event) do
    metadata = Map.new(Logger.metadata())
    %{event | extra: Map.merge(event.extra, metadata)}
  end

  def before_send_event_ignore_arithmetic(event) do
    case event.original_exception do
      %ArithmeticError{} ->
        false

      _ ->
        event
    end
  end
end
