#include <bits/stdc++.h>
#define ll long long
#define fi first
#define se second
#define pb emplace_back
#define ii pair<int, int>
#define MASK(i) (1LL << (i))
#define BIT(x, i) (((x) >> (i)) & 1)
#define sz(s) (int)((s).size())
#define all(a) a.begin(), a.end()
#define FOR(i, a, b) for (int i = (a), _b = (b); i <= _b; ++i)
#define F0R(i, b) for (int i = 0, _b = (b); i < _b; ++i)
#define FORd(i, a, b) for (int i = (a), _b = (b); i >= _b; --i)
#define F0Rd(i, b) for (int i = (b)-1; i >= 0; i--)
using namespace std;

template<typename T1, typename T2> bool ckmax(T1 &A, const T2 &B){if(A < B){A = B;return true;} return false;}
template<typename T1, typename T2> bool ckmin(T1 &A, const T2 &B){if(A > B){A = B;return true;} return false;}

const int MOD = (int)1e9 + 7;
const int N = 3e5 + 10, M = 18;
const int INF = (int)2e9 + 11;
const long long LINF = (long long)4e18 + 11;

vector<ll> get_divs(ll x){
    vector<ll> divs;
    for(ll d = 1; d * d <= x; ++d) if(x % d == 0){
        divs.pb(d);
        if(d * d != x) divs.pb(x / d);
    }
    sort(all(divs));
    return divs;
}

vector<vector<ii>> build_splits(const vector<ll> &divs){
    int n = sz(divs);
    unordered_map<ll, int> id;
    id.reserve(n * 2 + 1);
    F0R(i, n) id[divs[i]] = i;
    vector<vector<ii>> splits(n);
    F0R(i, n){
        ll x = divs[i];
        F0R(j, n) if(x % divs[j] == 0){
            ll rest = x / divs[j];
            auto it = id.find(rest);
            if(it != id.end()) splits[i].pb(j, it->se);
        }
    }
    return splits;
}

ll dp_answer(ll a, ll b){
    ll g = gcd(a, b);
    ll A = a / g, B = b / g;
    vector<ll> da = get_divs(A), db = get_divs(B);
    auto sa = build_splits(da);
    auto sb = build_splits(db);
    int na = sz(da), nb = sz(db);
    vector<ll> dp(na * nb, LINF);
    auto at = [&](int i, int j)->ll&{ return dp[i * nb + j]; };
    at(0, 0) = 0;
    F0R(i, na) F0R(j, nb){
        if(i == 0 && j == 0) continue;
        ll best = LINF;
        for(auto pa : sa[i]) for(auto pb : sb[j]){
            int di = pa.fi, pi = pa.se;
            int ei = pb.fi, pj = pb.se;
            if(di == 0 && ei == 0) continue;
            ckmin(best, at(pi, pj) + max(da[di], db[ei]));
        }
        at(i, j) = best;
    }
    return at(na - 1, nb - 1);
}

ll brute_answer(int n, int a, int b){
    vector<ll> dist(n + 1, LINF);
    priority_queue<pair<ll, int>, vector<pair<ll, int>>, greater<pair<ll, int>>> pq;
    dist[a] = 0;
    pq.push({0, a});
    while(!pq.empty()){
        auto [du, u] = pq.top(); pq.pop();
        if(du != dist[u]) continue;
        if(u == b) return du;
        FOR(v, 1, n) if(v != u){
            ll w = max(u, v) / gcd(u, v);
            if(ckmin(dist[v], du + w)) pq.push({dist[v], v});
        }
    }
    return dist[b];
}

void require_equal(int n, int a, int b, long long &tests){
    ll fast = dp_answer(a, b);
    ll slow = brute_answer(n, a, b);
    ++tests;
    if(fast != slow){
        cout << "Counterexample found\n";
        cout << "n = " << n << ", a = " << a << ", b = " << b << '\n';
        cout << "dp = " << fast << ", brute = " << slow << '\n';
        exit(0);
    }
}

void sol(void){
    long long tests = 0;
    FOR(n, 2, 30) FOR(a, 1, n) FOR(b, 1, n) if(a != b) require_equal(n, a, b, tests);
    mt19937 rng(712367);
    F0R(it, 5000){
        int n = 2 + (rng() % 99);
        int a = 1 + (rng() % n);
        int b = 1 + (rng() % n);
        if(a == b) b = b % n + 1;
        require_equal(n, a, b, tests);
    }
    cout << "All tests passed\n";
    cout << "Total tests: " << tests << '\n';
}

signed main(void){
    ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    int t = 1;
    while(t--) sol();
    cerr << "\nTime elapsed: " << 1000 * clock() / CLOCKS_PER_SEC << " ms\n";
}
