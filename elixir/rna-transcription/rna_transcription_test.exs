if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("rna_transcription.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule RNATranscriptionTest do
  use ExUnit.Case

  test "transcribes guanine to cytosine" do
    assert RNATranscription.to_rna('G') == 'C'
  end

  test "transcribes cytosine to guanine" do
    assert RNATranscription.to_rna('C') == 'G'
  end

  test "transcribes thymidine to adenine" do
    assert RNATranscription.to_rna('T') == 'A'
  end

  test "transcribes adenine to uracil" do
    assert RNATranscription.to_rna('A') == 'U'
  end

  test "it transcribes all dna nucleotides to rna equivalents" do
    assert RNATranscription.to_rna('ACGTGGTCTTAA') == 'UGCACCAGAAUU'
  end

  test "asdfasdf" do
    assert RNATranscription.to_rna('KKK') == ''
  end

  test "asdfasdflkajsdf" do
    assert RNATranscription.to_rna('GKT') == 'CA'
  end
end
