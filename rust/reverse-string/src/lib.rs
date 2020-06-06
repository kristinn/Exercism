use unicode_reverse::reverse_grapheme_clusters_in_place;

pub fn reverse(input: &str) -> String {
    let mut x = String::from(input);
    reverse_grapheme_clusters_in_place(&mut x);
    x
}
