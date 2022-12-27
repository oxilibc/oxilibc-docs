(function() {var implementors = {
"memchr":[["impl <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> for <a class=\"enum\" href=\"memchr/memmem/enum.Prefilter.html\" title=\"enum memchr::memmem::Prefilter\">Prefilter</a>"],["impl&lt;'n&gt; <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> for <a class=\"struct\" href=\"memchr/memmem/struct.Finder.html\" title=\"struct memchr::memmem::Finder\">Finder</a>&lt;'n&gt;"],["impl&lt;'n&gt; <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> for <a class=\"struct\" href=\"memchr/memmem/struct.FinderRev.html\" title=\"struct memchr::memmem::FinderRev\">FinderRev</a>&lt;'n&gt;"],["impl <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> for <a class=\"struct\" href=\"memchr/memmem/struct.FinderBuilder.html\" title=\"struct memchr::memmem::FinderBuilder\">FinderBuilder</a>"]],
"oxilibc":[["impl <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> for <a class=\"struct\" href=\"oxilibc/stdarg/struct.__va_list_tag.html\" title=\"struct oxilibc::stdarg::__va_list_tag\">__va_list_tag</a>"],["impl <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> for <a class=\"struct\" href=\"oxilibc/stddef/struct.max_align_t.html\" title=\"struct oxilibc::stddef::max_align_t\">max_align_t</a>"]],
"rbitset":[["impl&lt;T:&nbsp;<a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a>, const N:&nbsp;<a class=\"primitive\" href=\"https://doc.rust-lang.org/nightly/core/primitive.usize.html\">usize</a>&gt; <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> for <a class=\"struct\" href=\"rbitset/struct.BitSet.html\" title=\"struct rbitset::BitSet\">BitSet</a>&lt;T, N&gt;"],["impl <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> for <a class=\"enum\" href=\"rbitset/enum.BitSetError.html\" title=\"enum rbitset::BitSetError\">BitSetError</a>"],["impl&lt;T:&nbsp;<a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a>, const N:&nbsp;<a class=\"primitive\" href=\"https://doc.rust-lang.org/nightly/core/primitive.usize.html\">usize</a>&gt; <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> for <a class=\"struct\" href=\"rbitset/struct.IntoIter.html\" title=\"struct rbitset::IntoIter\">IntoIter</a>&lt;T, N&gt;"],["impl&lt;'a, T:&nbsp;<a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a>, const N:&nbsp;<a class=\"primitive\" href=\"https://doc.rust-lang.org/nightly/core/primitive.usize.html\">usize</a>&gt; <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> for <a class=\"struct\" href=\"rbitset/struct.Iter.html\" title=\"struct rbitset::Iter\">Iter</a>&lt;'a, T, N&gt;"],["impl&lt;'a, T:&nbsp;<a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> + <a class=\"trait\" href=\"num_traits/int/trait.PrimInt.html\" title=\"trait num_traits::int::PrimInt\">PrimInt</a> + 'a, U:&nbsp;<a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> + <a class=\"trait\" href=\"num_traits/int/trait.PrimInt.html\" title=\"trait num_traits::int::PrimInt\">PrimInt</a> + 'a, const N:&nbsp;<a class=\"primitive\" href=\"https://doc.rust-lang.org/nightly/core/primitive.usize.html\">usize</a>, const M:&nbsp;<a class=\"primitive\" href=\"https://doc.rust-lang.org/nightly/core/primitive.usize.html\">usize</a>&gt; <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> for <a class=\"struct\" href=\"rbitset/struct.Difference.html\" title=\"struct rbitset::Difference\">Difference</a>&lt;'a, T, U, N, M&gt;"],["impl&lt;'a, T:&nbsp;<a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a>, U:&nbsp;<a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a>, const N:&nbsp;<a class=\"primitive\" href=\"https://doc.rust-lang.org/nightly/core/primitive.usize.html\">usize</a>, const M:&nbsp;<a class=\"primitive\" href=\"https://doc.rust-lang.org/nightly/core/primitive.usize.html\">usize</a>&gt; <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> for <a class=\"struct\" href=\"rbitset/struct.Intersection.html\" title=\"struct rbitset::Intersection\">Intersection</a>&lt;'a, T, U, N, M&gt;<span class=\"where fmt-newline\">where<br>&nbsp;&nbsp;&nbsp;&nbsp;T: <a class=\"trait\" href=\"num_traits/int/trait.PrimInt.html\" title=\"trait num_traits::int::PrimInt\">PrimInt</a> + 'a,<br>&nbsp;&nbsp;&nbsp;&nbsp;U: <a class=\"trait\" href=\"num_traits/int/trait.PrimInt.html\" title=\"trait num_traits::int::PrimInt\">PrimInt</a> + 'a,</span>"],["impl&lt;'a, T:&nbsp;<a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> + <a class=\"trait\" href=\"num_traits/int/trait.PrimInt.html\" title=\"trait num_traits::int::PrimInt\">PrimInt</a> + 'a, U:&nbsp;<a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> + <a class=\"trait\" href=\"num_traits/int/trait.PrimInt.html\" title=\"trait num_traits::int::PrimInt\">PrimInt</a> + 'a, const N:&nbsp;<a class=\"primitive\" href=\"https://doc.rust-lang.org/nightly/core/primitive.usize.html\">usize</a>, const M:&nbsp;<a class=\"primitive\" href=\"https://doc.rust-lang.org/nightly/core/primitive.usize.html\">usize</a>&gt; <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> for <a class=\"struct\" href=\"rbitset/struct.Union.html\" title=\"struct rbitset::Union\">Union</a>&lt;'a, T, U, N, M&gt;"],["impl&lt;'a, T:&nbsp;<a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a>, U:&nbsp;<a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a>, const N:&nbsp;<a class=\"primitive\" href=\"https://doc.rust-lang.org/nightly/core/primitive.usize.html\">usize</a>, const M:&nbsp;<a class=\"primitive\" href=\"https://doc.rust-lang.org/nightly/core/primitive.usize.html\">usize</a>&gt; <a class=\"trait\" href=\"https://doc.rust-lang.org/nightly/core/clone/trait.Clone.html\" title=\"trait core::clone::Clone\">Clone</a> for <a class=\"struct\" href=\"rbitset/struct.SymmetricDifference.html\" title=\"struct rbitset::SymmetricDifference\">SymmetricDifference</a>&lt;'a, T, U, N, M&gt;<span class=\"where fmt-newline\">where<br>&nbsp;&nbsp;&nbsp;&nbsp;T: <a class=\"trait\" href=\"num_traits/int/trait.PrimInt.html\" title=\"trait num_traits::int::PrimInt\">PrimInt</a> + 'a,<br>&nbsp;&nbsp;&nbsp;&nbsp;U: <a class=\"trait\" href=\"num_traits/int/trait.PrimInt.html\" title=\"trait num_traits::int::PrimInt\">PrimInt</a> + 'a,</span>"]]
};if (window.register_implementors) {window.register_implementors(implementors);} else {window.pending_implementors = implementors;}})()