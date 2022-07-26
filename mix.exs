# credo:disable-for-this-file Credo.Check.Readability.Specs
defmodule ExpoPluralForms.MixProject do
  @moduledoc false

  use Mix.Project

  @version "0.0.0"
  @source_url "https://github.com/elixir-gettext/expo_plural_forms"

  def project do
    [
      app: :expo_plural_forms,
      version: @version,
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      test_coverage: [tool: ExCoveralls],
      description: description(),
      dialyzer:
        [list_unused_filters: true, plt_add_apps: [:mix]] ++
          if (System.get_env("DIALYZER_PLT_PRIV") || "false") in ["1", "true"] do
            [plt_file: {:no_warn, "priv/plts/dialyzer.plt"}]
          else
            []
          end,
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.html": :test,
        "coveralls.json": :test,
        "coveralls.post": :test,
        "coveralls.xml": :test
      ],
      package: package(),
      yecc_options: if(Mix.env() in [:dev, :test], do: [verbose: true])
    ]
  end

  defp package do
    %{
      licenses: ["Apache-2.0"],
      maintainers: ["Jonatan Männchen"],
      links: %{
        "GitHub" => @source_url,
        "Changelog" => @source_url <> "/releases",
        "Issues" => @source_url <> "/issues"
      }
    }
  end

  defp description do
    """
    A parser for plural form headers in PO files
    """
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp docs do
    [
      source_url: @source_url,
      source_ref: "v" <> @version
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nimble_parsec, "~> 1.2", runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev], runtime: false},
      {:excoveralls, "~> 0.5", only: [:test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:credo, "~> 1.0", only: [:dev], runtime: false}
    ]
  end
end
